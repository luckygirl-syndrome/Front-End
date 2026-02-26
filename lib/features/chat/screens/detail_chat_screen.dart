import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/utils/format_utils.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/chat_provider.dart';
import '../models/chat_model.dart';
import 'package:ttobaba/features/chat/widgets/final_score_overlay.dart';

class DetailChatScreen extends ConsumerStatefulWidget {
  final int userProductId;
  const DetailChatScreen({super.key, required this.userProductId});

  @override
  ConsumerState<DetailChatScreen> createState() => _DetailChatScreenState();
}

/// "분석 중" 오버레이에서 /room 재요청 최대 횟수 (이 횟수 넘기면 오버레이 해제, 폴링 중단)
const int _kMaxAnalysisRetries = 12; // 12 * 5초 = 1분

/// API의 platform 값(musinsa, zigzag, ably) → 화면 표시용 브랜드명
String _platformToBrand(String? platform) {
  if (platform == null || platform.isEmpty) return '분석 중';
  switch (platform.toLowerCase()) {
    case 'musinsa':
      return '무신사';
    case 'zigzag':
      return '지그재그';
    case 'ably':
      return '에이블리';
    default:
      return platform;
  }
}

/// "다시 시도" / 분석 중 재시도 시: 우선 finalize-survey를 호출해 세션 재준비.
/// - 저장된 설문이 있으면 그 값을 사용, 없으면 기본값(1,1,1,1)
/// - 반환: first_reply가 유효(에러 문구 아님)면 해당 텍스트, 아니면 null.
///   유효 시 호출 쪽에서 타이머 중단 후 room 갱신. 텍스트가 있으면 오버레이 숨기고 채팅 시작 처리에 사용.
Future<String?> _retryRoomWithFinalizeSurveyIfNeeded(
    WidgetRef ref, int userProductId) async {
  final stored = ref.read(lastSurveyAnswersProvider)[userProductId];
  final SurveyAnswers effective =
      stored ?? const SurveyAnswers(q1: 1, q2: 1, q3: 1, qc: 1);

  try {
    final reply = await ref.read(chatProvider.notifier).finalizeSurvey(
          userProductId: userProductId,
          q1: effective.q1,
          q2: effective.q2,
          q3: effective.q3,
          qc: effective.qc,
        );
    final text = reply?.reply;
    final valid = text != null &&
        text.isNotEmpty &&
        !ChatNotifier.isAnalysisErrorReply(text);
    return valid ? text : null;
  } catch (_) {
    return null;
  }
}

class _DetailChatScreenState extends ConsumerState<DetailChatScreen>
    with SingleTickerProviderStateMixin {
  Timer? _analysisRetryTimer;
  int _analysisRetryCount = 0;
  late final AnimationController _spinnerController;
  final TextEditingController _inputController = TextEditingController();
  // 낙관적 UI: 보낸 메시지 즉시 표시, AI 응답 대기 중엔 쩜쩜쩜
  String? _pendingUserMessage;
  DateTime? _pendingUserMessageSentAt; // 전송 시각 (시간 표시용)
  bool _isLoadingReply = false;
  String? _pendingReply;
  bool _pendingCleared = false;
  final ScrollController _scrollController = ScrollController();
  int _lastMessageCount = 0;
  bool _didInitialScrollToBottom = false;
  bool _chatEnded = false; // POST /api/chat/exit 호출 후 true
  int? _finalScore; // LLM이 계산한 최종 점수 (exit 시 포함)
  bool _showFinalScoreOverlay = false; // 종료 팝업 표시 여부
  int? _displayScore; // 롤링/최종 표시용 점수
  Timer? _scoreRollingTimer;
  /// finalize-survey 재시도에서 유효한 first_reply를 받았을 때. 오버레이 숨기고 채팅 시작.
  String? _pendingValidFirstReplyFromRetry;

  void _startScoreRolling() {
    _scoreRollingTimer?.cancel();
    _scoreRollingTimer =
        Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (!mounted) return;
      // 최종 점수를 받기 전까지만 슬롯머신처럼 숫자 변경
      if (_finalScore != null) {
        _stopScoreRolling();
        return;
      }
      setState(() {
        _displayScore = Random().nextInt(101); // 0~100
      });
    });
  }

  void _stopScoreRolling() {
    _scoreRollingTimer?.cancel();
    _scoreRollingTimer = null;
  }

  @override
  void initState() {
    super.initState();
    _spinnerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _analysisRetryTimer?.cancel();
    _scoreRollingTimer?.cancel();
    _spinnerController.dispose();
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(chatRoomDetailProvider(widget.userProductId));
    // 갱신 중에도 이전 데이터가 있으면 그대로 표시 (채팅/입력창 유지, 아래에만 로딩 표시)
    final detail = detailAsync.valueOrNull;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: detailAsync.when(
          data: (d) => _buildChatBody(ref, d),
          loading: () {
            if (detail != null) {
              return Stack(
                children: [
                  _buildChatBody(ref, detail),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        color: Colors.black26,
                        child: const Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
          error: (err, stack) => _buildErrorState(
            context,
            ref,
            widget.userProductId,
            err,
          ),
        ),
      ),
    );
  }

  /// exit 버튼(FINISHED), 구매 완료(PURCHASED), 구매 포기(ABANDONED) 모두 '채팅 종료'로 간주
  static bool _isChatEndedStatus(String? status) {
    if (status == null || status.isEmpty) return false;
    return status == 'FINISHED' ||
        status == 'PURCHASED' ||
        status == 'ABANDONED';
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      final position = _scrollController.position;
      final target = position.maxScrollExtent;
      // 새 메시지가 맨 아래 보이도록 스르륵 이동 (용수철처럼 튀지 않도록)
      position.animateTo(
        target,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
  }

  Widget _buildChatBody(WidgetRef ref, ChatRoomDetailResponse detail) {
    final displayMessages =
        _displayMessages(detail, overrideFirstReply: _pendingValidFirstReplyFromRetry);
    final count = _itemCount(detail, displayMessages);
    if (count > _lastMessageCount) {
      _lastMessageCount = count;
      _scrollToBottom();
    }
    // 채팅방 첫 진입 시 리스트 로드 후 맨 아래로 스크롤
    if (!_didInitialScrollToBottom && detail.messages.isNotEmpty) {
      _didInitialScrollToBottom = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 150), () {
          if (!mounted) return;
          _scrollToBottom();
        });
      });
    }

    // 서버에 방금 보낸 메시지+답변이 반영되면 pending 제거 (중복 방지)
    if (_pendingReply != null &&
        detail.messages.length >= 2 &&
        detail.messages.last.role == 'assistant' &&
        detail.messages.last.message == _pendingReply &&
        !_pendingCleared) {
      _pendingCleared = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        setState(() {
          _pendingUserMessage = null;
          _pendingUserMessageSentAt = null;
          _pendingReply = null;
          _pendingCleared = false;
        });
      });
    }
    final hasValidFirst = ChatNotifier.hasValidFirstMessage(detail);
    if (hasValidFirst && _pendingValidFirstReplyFromRetry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        setState(() => _pendingValidFirstReplyFromRetry = null);
      });
    }
    final showAnalysisOverlay = detail.messages.isNotEmpty &&
        !hasValidFirst &&
        _pendingValidFirstReplyFromRetry == null &&
        _analysisRetryCount < _kMaxAnalysisRetries;
    if (showAnalysisOverlay) {
      _startAnalysisRetryTimer();
    } else {
      _stopAnalysisRetryTimer();
    }
    // 이미 종료된 채팅방(exit / 구매 완료 / 구매 포기)을 다시 열었을 때 배너 표시
    final isEndedByStatus = _isChatEndedStatus(detail.status);
    if (isEndedByStatus && !_chatEnded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _chatEnded = true;
            // 서버에 저장된 최종 점수가 있으면 배너에 다시 표시
            _finalScore = detail.finalScore;
            _displayScore = detail.finalScore;
          });
        }
      });
    }
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.white,
                  AppColors.primaryMain,
                ],
              ),
            ),
          ),
        ),
        // iOS 등에서 statusBarColor가 무시될 때 상단 상태바 영역을 흰색으로 채움
        if (topPadding > 0)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: topPadding,
            child: Container(color: AppColors.white),
          ),
        SafeArea(
          bottom: false,
          child: Column(
            children: [
              _buildTopBar(context, detail),
              _buildProductHeader(detail),
              _buildActionButtons(context, ref, detail),
              Expanded(
                child: Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final displayMessages = _displayMessages(detail);
                        return ListView.builder(
                          controller: _scrollController,
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          itemCount: _itemCount(detail, displayMessages),
                          itemBuilder: (context, index) {
                            return _buildChatListItem(
                                context, detail, index, displayMessages);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              if (_chatEnded) _buildChatEndedBanner(),
              _buildInputArea(ref),
            ],
          ),
        ),
        if (showAnalysisOverlay) _buildAnalysisLoadingOverlay(ref),
        if (_showFinalScoreOverlay)
          FinalScoreOverlay(
            finalScore: _displayScore ?? _finalScore ?? 0,
            onClosePopup: () {
              setState(() {
                _showFinalScoreOverlay = false;
              });
              _stopScoreRolling();
            },
          ),
      ],
    );
  }

  /// POST /api/chat/exit 호출 후 입력창 위에 표시되는 종료 배너
  /// (검은색 + 파란 "또바바 지수" 박스).
  Widget _buildChatEndedBanner() {
    // 하단 바는 슬롯머신 없이 최종 점수만 노출
    final scoreText = _finalScore?.toString() ?? ''; // 값 없으면 숫자 숨김

    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        children: [
          // 왼쪽: 검은색 "채팅이 종료되었어요!" (Bold 20)
          Expanded(
            flex: 273,
            child: Container(
              height: 78,
              decoration: const BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              alignment: Alignment.center,
              child: Text(
                '채팅이 종료되었어요!',
                style:
                    AppTextStyles.ptdBold(20).copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // 오른쪽: 파란색 "또바바 지수" (Medium 16) + 점수 (ExtraBold 32)
          Expanded(
            flex: 117,
            child: Container(
              height: 78,
              decoration: const BoxDecoration(
                color: AppColors.secondaryMain,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '또바바 지수',
                    style: AppTextStyles.ptdMedium(16)
                        .copyWith(color: AppColors.white),
                  ),
                  Text(
                    scoreText,
                    style: AppTextStyles.ptdExtraBold(24)
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 4. 하단 입력창 + 시스템바(맨 아래)까지 AppColors.white 배경.
  Widget _buildInputArea(WidgetRef ref) {
    return Container(
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.paleGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _inputController,
                        style: AppTextStyles.ptdMedium(16),
                        decoration: InputDecoration(
                          hintText: "메시지 쓰기..",
                          border: InputBorder.none,
                          hintStyle: AppTextStyles.ptdMedium(
                            12,
                          ).copyWith(color: AppColors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      if (_isLoadingReply) return; // AI 응답 대기 중에는 전송 불가
                      final text = _inputController.text.trim();
                      if (text.isEmpty) return;

                      _inputController.clear();
                      setState(() {
                        _pendingUserMessage = text;
                        _pendingUserMessageSentAt = DateTime.now();
                        _isLoadingReply = true;
                        _pendingReply = null;
                      });
                      _scrollToBottom(); // 내 메시지 올라갈 때 스크롤
                      final reply = await ref
                          .read(chatProvider.notifier)
                          .sendMessage(widget.userProductId, text);

                      if (!mounted) return;
                      setState(() {
                        _isLoadingReply = false;
                        _pendingReply = reply?.reply;
                      });
                      _scrollToBottom(); // AI 답 올라갈 때 스크롤
                      if (reply == null) {
                        setState(() {
                          _pendingUserMessage = null;
                          _pendingUserMessageSentAt = null;
                          _pendingReply = null;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("메시지 전송에 실패했습니다.")),
                        );
                      } else {
                        ref.refresh(
                            chatRoomDetailProvider(widget.userProductId));
                        // LLM이 종료 메시지를 반환했으면 exit API 호출 → 방 상태 FINISHED, 목록 갱신
                        if (reply.isExit == true) {
                          debugPrint(
                              '🏁 [Chat] LLM 종료 응답 수신 → POST /api/chat/exit 호출');

                          // 1) 먼저 팝업 + 롤링 시작
                          setState(() {
                            _chatEnded = true;
                            _showFinalScoreOverlay = true;
                            _finalScore = null;
                            _displayScore = null;
                          });
                          _startScoreRolling();

                          // 2) 백엔드로 최종 점수 요청
                          final exitReply = await ref
                              .read(chatProvider.notifier)
                              .exitChat(widget.userProductId);

                          if (mounted) {
                            _stopScoreRolling();
                            setState(() {
                              _chatEnded = true;
                              _finalScore =
                                  exitReply?.finalScore ?? reply.finalScore;
                              _displayScore = _finalScore;
                            });
                            ref.refresh(
                                chatRoomDetailProvider(widget.userProductId));
                          }
                        }
                      }
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _isLoadingReply
                            ? AppColors.darkerGrey
                            : AppColors.primaryMain,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 맨 아래 상태바(홈 인디케이터) 영역까지 흰색 배경
          Builder(
            builder: (context) => Container(
              height: MediaQuery.of(context).padding.bottom,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// 설문(8) 다음 첫 리플라이 구간에서 에러 메시지 중복 제거, 성공한 마지막 1개만 표시.
  /// [overrideFirstReply]가 있으면 첫 리플라이 내용을 이 텍스트로 대체 (finalize-survey 재시도로 받은 유효 응답).
  List<ChatMessageResponse> _displayMessages(
    ChatRoomDetailResponse detail, {
    String? overrideFirstReply,
  }) {
    List<ChatMessageResponse> _stripExit(List<ChatMessageResponse> list) {
      if (list.isEmpty) return list;
      final last = list.last;
      if ((last.role ?? '').toLowerCase() == 'user' &&
          last.message.trim() == '[EXIT]') {
        return list.sublist(0, list.length - 1);
      }
      return list;
    }

    if (detail.messages.length <= 8) {
      return _stripExit(detail.messages);
    }
    const surveyCount = 8;
    final rest = detail.messages.sublist(surveyCount);
    if (rest.isEmpty) return _stripExit(detail.messages);
    int i = 0;
    while (i < rest.length && rest[i].role == 'assistant') {
      i++;
    }
    if (i <= 1) return _stripExit(detail.messages);
    final firstReplyBlock = rest.sublist(0, i);
    ChatMessageResponse lastOnly = firstReplyBlock.last;
    if (overrideFirstReply != null) {
      lastOnly = lastOnly.copyWith(message: overrideFirstReply);
    }
    final filtered =
        detail.messages.sublist(0, surveyCount) + [lastOnly] + rest.sublist(i);
    return _stripExit(filtered);
  }

  int _itemCount(ChatRoomDetailResponse detail,
      List<ChatMessageResponse> displayMessages) {
    int base = displayMessages.isEmpty ? 1 : displayMessages.length;
    if (_pendingUserMessage != null) {
      base += 1;
      if (_isLoadingReply || _pendingReply != null) base += 1;
    }
    return base;
  }

  Widget _buildChatListItem(
    BuildContext context,
    ChatRoomDetailResponse detail,
    int index,
    List<ChatMessageResponse> displayMessages,
  ) {
    const padding = EdgeInsets.symmetric(horizontal: 24, vertical: 8);
    final baseCount = displayMessages.isEmpty ? 1 : displayMessages.length;
    if (displayMessages.isEmpty && index == 0) {
      return Padding(
        padding: padding,
        child: _buildChatBubble(
          context,
          "상품 정보를 열심히 분석하고 있어요!\n잠시만 기다려 주시면 상품 정보와 함께 분석 내용을 알려드릴게요.",
          isMine: false,
          time: "시스템",
        ),
      );
    }
    if (index < baseCount) {
      final msg = displayMessages[index];
      return Padding(
        padding: padding,
        child: _buildChatBubble(
          context,
          msg.message,
          isMine: msg.role == 'user',
          time: formatChatTime(msg.createdAt),
        ),
      );
    }
    if (_pendingUserMessage != null && index == baseCount) {
      final timeStr = _pendingUserMessageSentAt != null
          ? formatChatTimeFromDateTime(_pendingUserMessageSentAt!)
          : '보냄';
      return Padding(
        padding: padding,
        child: _buildChatBubble(
          context,
          _pendingUserMessage!,
          isMine: true,
          time: timeStr,
        ),
      );
    }
    // index == baseCount + 1: AI 대기 중(쩜쩜쩜) 또는 받은 답
    if (_isLoadingReply) {
      return Padding(
        padding: padding,
        child: _buildTypingIndicator(context),
      );
    }
    if (_pendingReply != null) {
      return Padding(
        padding: padding,
        child: _buildChatBubble(
          context,
          _pendingReply!,
          isMine: false,
          time: "",
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildTypingIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.paleGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: _TypingDots(),
        ),
      ],
    );
  }

  void _startAnalysisRetryTimer() {
    _analysisRetryTimer ??= Timer.periodic(
      const Duration(seconds: 5),
      (_) async {
        if (!mounted) return;
        _analysisRetryCount++;
        if (_analysisRetryCount >= _kMaxAnalysisRetries) {
          _stopAnalysisRetryTimer(resetCount: false);
        }
        final validReplyText =
            await _retryRoomWithFinalizeSurveyIfNeeded(ref, widget.userProductId);
        if (!mounted) return;
        if (validReplyText != null) {
          _stopAnalysisRetryTimer();
          setState(() => _pendingValidFirstReplyFromRetry = validReplyText);
          await Future.delayed(const Duration(milliseconds: 400));
          if (!mounted) return;
        }
        ref.invalidate(chatRoomDetailProvider(widget.userProductId));
      },
    );
  }

  void _stopAnalysisRetryTimer({bool resetCount = true}) {
    _analysisRetryTimer?.cancel();
    _analysisRetryTimer = null;
    if (resetCount) _analysisRetryCount = 0;
  }

  Widget _buildAnalysisLoadingOverlay(WidgetRef ref) {
    return Positioned.fill(
      child: Material(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _spinnerController,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/images/avatars/image 200.png',
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Text(
                '또바가 열심히\n분석하고 있어요',
                textAlign: TextAlign.center,
                style: AppTextStyles.ptdExtraBold(24).copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () async {
                  final validReplyText =
                      await _retryRoomWithFinalizeSurveyIfNeeded(
                          ref, widget.userProductId);
                  if (!mounted) return;
                  if (validReplyText != null) {
                    _stopAnalysisRetryTimer();
                    setState(() => _pendingValidFirstReplyFromRetry = validReplyText);
                  }
                  ref.invalidate(
                      chatRoomDetailProvider(widget.userProductId));
                },
                child: Text(
                  '다시 시도',
                  style: AppTextStyles.ptdMedium(14).copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    WidgetRef ref,
    int userProductId,
    Object error,
  ) {
    final is404 = error.toString().contains('404');
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 48,
              color: AppColors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              is404
                  ? '채팅방을 준비하고 있어요.\n잠시 후 다시 시도해 주세요.'
                  : '오류가 발생했습니다.\n다시 시도해 주세요.',
              textAlign: TextAlign.center,
              style: AppTextStyles.ptdMedium(16).copyWith(
                color: AppColors.black.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              text: '다시 시도',
              onPressed: () async {
                await _retryRoomWithFinalizeSurveyIfNeeded(ref, userProductId);
                if (!context.mounted) return;
                ref.invalidate(chatRoomDetailProvider(userProductId));
              },
              backgroundColor: AppColors.primaryMain,
              textColor: AppColors.white,
              borderColor: AppColors.primaryMain,
              textStyle: AppTextStyles.ptdBold(14),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.pushReplacement('/chat_list'),
              child: Text(
                '채팅 목록으로',
                style: AppTextStyles.ptdMedium(14).copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, ChatRoomDetailResponse detail) {
    final String? productUrl = detail.productUrl;
    final bool hasShopLink = productUrl != null &&
        productUrl.isNotEmpty &&
        (productUrl.startsWith('http://') || productUrl.startsWith('https://'));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 0),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // 👈 Arrangement.SpaceBetween 구현 [cite: 2026-02-16]
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. 왼쪽: 뒤로가기 → 이전 화면으로
          GestureDetector(
            onTap: () => context.pop(),
            behavior: HitTestBehavior.opaque,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
              size: 24,
            ),
          ),

          // 2. 중앙: 디자인상 빈 공간 (Auto)
          const Spacer(),

          // 3. 오른쪽: 아이콘 그룹 (shop → 해당 상품 쇼핑몰 페이지 / 더보기)
          Row(
            children: [
              GestureDetector(
                onTap: hasShopLink ? () => _openProductUrl(productUrl!) : null,
                behavior: HitTestBehavior.opaque,
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: hasShopLink ? AppColors.black : AppColors.grey,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.more_horiz, color: AppColors.black, size: 24),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openProductUrl(String url) async {
    final uri = Uri.parse(url);
    try {
      // canLaunchUrl은 iOS 시뮬레이터 등에서 채널 오류를 일으킬 수 있어, 바로 launchUrl 시도
      final launched =
          await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('링크를 열 수 없어요.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('링크 열기 실패: $e')),
        );
      }
    }
  }

  // 1. 상단 상품 정보 레이아웃
  Widget _buildProductHeader(ChatRoomDetailResponse detail) {
    final String productName =
        (detail.productName.isEmpty || detail.productName == "null")
            ? "분석 중인 상품입니다..."
            : detail.productName;

    return Container(
      // 디자인 가이드 수치: 좌32, 상32, 우32, 하20
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. 왼쪽 상품 이미지 (88x88, 오버플로우 방지) [cite: 2026-02-16]
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: (detail.productImg != null && detail.productImg!.isNotEmpty)
                ? Image.network(
                    detail.productImg!,
                    width: 88,
                    height: 88,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 88,
                      height: 88,
                      color: AppColors.lightGrey,
                      child: const Icon(
                        Icons.downloading,
                        color: AppColors.grey,
                      ),
                    ),
                  )
                : Container(
                    width: 88,
                    height: 88,
                    color: AppColors.paleGrey,
                    child: const Icon(
                      Icons.image_search,
                      color: AppColors.grey,
                      size: 40,
                    ),
                  ),
          ),
          const SizedBox(width: 40),

          // 2. 오른쪽 텍스트 영역 (이미지 높이와 동일, 88px로 여유 확보)
          Expanded(
            child: SizedBox(
              height: 88,
              child: Column(
                // 👈 상단과 하단을 양 끝으로 밀어 이미지 라인에 맞춤
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // [상단 그룹] 브랜드(플랫폼) + 상품명
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _platformToBrand(detail.platform),
                        style: AppTextStyles.ptdBold(
                          12,
                        ).copyWith(color: AppColors.black),
                      ),
                      Text(
                        productName,
                        style: AppTextStyles.ptdRegular(14),
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ],
                  ),

                  // [하단 그룹] 태그 + 가격 (리스트와 동일: 구매완료=노란 테두리+노란 글씨, 구매포기=노란 배경+흰 글씨, 고민중=회색)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: _buildStatusTag(detail.statusLabel),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        formatPriceWithUnit(detail.price),
                        style: AppTextStyles.ptdBold(20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTag(String statusLabel) {
    final String text = statusLabel.isEmpty ? "분석 중" : statusLabel;
    final bool isAnalyzing = statusLabel.contains("분석") || statusLabel.isEmpty;
    final bool isConsidering = statusLabel.contains("고민");
    final bool isPurchased = statusLabel.contains("구매 완료");
    final bool isGaveUp = statusLabel.contains("구매 포기");

    Color bgColor;
    Color textColor;
    BoxBorder? border;

    if (isAnalyzing) {
      bgColor = AppColors.grey;
      textColor = AppColors.white;
      border = null;
    } else if (isConsidering) {
      bgColor = AppColors.white;
      textColor = AppColors.lightGrey;
      border = Border.all(color: AppColors.lightGrey);
    } else if (isPurchased) {
      bgColor = AppColors.white;
      textColor = AppColors.primaryMain;
      border = Border.all(color: AppColors.primaryMain);
    } else {
      assert(isGaveUp);
      bgColor = AppColors.primaryMain;
      textColor = AppColors.white;
      border = null;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        border: border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTextStyles.ptdMedium(12).copyWith(color: textColor),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    WidgetRef ref,
    ChatRoomDetailResponse data,
  ) {
    // statusLabel 기준: "고민 중" → 안 살래요/살래요, "구매 완료"/"구매 포기" → 내 평가 확인하기 + 저 사실...
    final isConsidering = data.statusLabel.contains('고민');
    final isPurchased = data.statusLabel.contains('구매 완료');
    final isEvaluated = data.isEvaluated ?? false;

    return Container(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 12),
      color: AppColors.white,
      child: Row(
        children: [
          if (isConsidering) ...[
            // 1. 고민 중: 안 살래요 / 살래요
            Expanded(
              child: AppButton(
                text: "안 살래요",
                onPressed: () =>
                    _updateStatus(context, ref, false, "구매 포기 처리되었습니다."),
                backgroundColor: AppColors.secondaryMain,
                textColor: AppColors.white,
                borderColor: AppColors.secondaryMain,
                textStyle: AppTextStyles.ptdBold(14),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppButton(
                text: "살래요",
                onPressed: () =>
                    _updateStatus(context, ref, true, "구매 결정! 축하드려요."),
                backgroundColor: AppColors.primaryMain,
                textColor: AppColors.white,
                borderColor: AppColors.primaryMain,
                textStyle: AppTextStyles.ptdBold(14),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ] else ...[
            // 2. 구매 완료 → 내 평가 확인하기 + "저 사실... 반품했어요" / 구매 포기 → + "저 사실... 샀어요"
            Expanded(
              child: AppButton(
                text: isEvaluated ? "내 평가 확인하기" : "평가하기",
                onPressed: () =>
                    context.push(isEvaluated ? '/feedback/view' : '/feedback'),
                backgroundColor: AppColors.white,
                textColor: AppColors.black,
                borderColor: AppColors.black,
                borderWidth: 1,
                textStyle: AppTextStyles.ptdBold(14),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppButton(
                text: isPurchased ? "저 사실... 반품했어요" : "저 사실... 샀어요",
                onPressed: () {
                  final newStatus = !isPurchased;
                  final msg =
                      isPurchased ? "반품(구매 포기) 처리되었습니다." : "구매 완료로 변경되었습니다.";
                  _updateStatus(context, ref, newStatus, msg);
                },
                backgroundColor: AppColors.black,
                textColor: AppColors.white,
                borderColor: AppColors.black,
                textStyle: AppTextStyles.ptdBold(14),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _updateStatus(
    BuildContext context,
    WidgetRef ref,
    bool isPurchased,
    String message,
  ) async {
    final success = await ref
        .read(chatProvider.notifier)
        .updateChatStatus(widget.userProductId, isPurchased);

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? message : "상태 변경에 실패했습니다."),
          backgroundColor: success ? AppColors.black : Colors.red,
        ),
      );
      if (success) {
        ref.refresh(chatRoomDetailProvider(widget.userProductId));
      }
    }
  }

  Widget _buildChatBubble(
    BuildContext context,
    String message, {
    required bool isMine,
    required String time,
  }) {
    return Align(
      // 1. 내 메시지는 오른쪽, 상대 메시지는 왼쪽 정렬
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            // 최대 너비를 화면의 70% 정도로 제한하여 가독성 확보
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              // 2. 비대칭 모서리 적용 [cite: 2026-02-16]
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                // 상대(isMine: false) -> 왼쪽 아래 0, 나(isMine: true) -> 오른쪽 아래 0
                bottomLeft: Radius.circular(isMine ? 12 : 0),
                bottomRight: Radius.circular(isMine ? 0 : 12),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12),
              ],
            ),
            child: Text(
              message,
              style: AppTextStyles.ptdMedium(16).copyWith(height: 1.4),
            ),
          ),
          const SizedBox(height: 8),
          // 3. 시간 표시
          Text(
            time,
            style: AppTextStyles.ptdMedium(8).copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}

/// AI 응답 대기 중 "쩜쩜쩜" 애니메이션
class _TypingDots extends StatefulWidget {
  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final t = (_controller.value + i / 3) % 1.0;
            final opacity =
                0.3 + 0.7 * (0.5 - (t - 0.5).abs()).clamp(0.0, 1.0) * 2;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                '·',
                style: AppTextStyles.ptdMedium(20).copyWith(
                  color: AppColors.black.withValues(alpha: opacity),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
