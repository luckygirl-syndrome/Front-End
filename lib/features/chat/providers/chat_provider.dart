import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/features/chat/models/chat_model.dart';
import 'package:ttobaba/features/chat/repositories/chat_repository.dart';

/// 설문 답변 (q1, q2, q3, qc). 채팅 "다시 시도" 시 finalize-survey 재호출용.
class SurveyAnswers {
  const SurveyAnswers({
    required this.q1,
    required this.q2,
    required this.q3,
    required this.qc,
  });
  final int q1;
  final int q2;
  final int q3;
  final int qc;
}

class LastSurveyAnswersNotifier extends StateNotifier<Map<int, SurveyAnswers>> {
  LastSurveyAnswersNotifier() : super({});

  void setAnswers(int userProductId, SurveyAnswers answers) {
    state = {...state, userProductId: answers};
  }

  SurveyAnswers? getAnswers(int userProductId) => state[userProductId];
}

final lastSurveyAnswersProvider =
    StateNotifierProvider<LastSurveyAnswersNotifier, Map<int, SurveyAnswers>>(
        (ref) => LastSurveyAnswersNotifier());

// 1. 채팅 필터
enum ChatFilter { all, decided, considering }

// 2. 채팅 상태 모델
class ChatState {
  final ChatListResponse? chatData;
  final bool isFallback;
  final bool isLoading;
  final ChatFilter filter;

  ChatState({
    this.chatData,
    this.isFallback = false,
    this.isLoading = false,
    this.filter = ChatFilter.all,
  });

  ChatState copyWith({
    ChatListResponse? chatData,
    bool? isFallback,
    bool? isLoading,
    ChatFilter? filter,
  }) {
    return ChatState(
      chatData: chatData ?? this.chatData,
      isFallback: isFallback ?? this.isFallback,
      isLoading: isLoading ?? this.isLoading,
      filter: filter ?? this.filter,
    );
  }

  /// status_label 기준 필터: 전체 / 결정 완료(구매완료·구매포기) / 고민 중
  List<ChatListItem> get chatList {
    final list = chatData?.allChats ?? [];
    if (filter == ChatFilter.all) return list;
    if (filter == ChatFilter.decided) {
      return list
          .where((item) =>
              item.statusLabel.contains('구매 완료') ||
              item.statusLabel.contains('구매 포기'))
          .toList();
    }
    if (filter == ChatFilter.considering) {
      return list.where((item) => item.statusLabel.contains('고민')).toList();
    }
    return list;
  }
}

// 3. 채팅 Notifier (로직 담당)
class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;

  ChatNotifier(this.ref) : super(ChatState()) {
    loadChatList();
  }

  Future<void> loadChatList() async {
    state = state.copyWith(isLoading: true);
    try {
      final repository = ref.read(chatRepositoryProvider);
      final chatData = await repository.getChatList();
      state = state.copyWith(
        chatData: chatData,
        isLoading: false,
        isFallback: false,
      );
    } catch (e) {
      debugPrint("❌ [Load Chat List] API Error: $e");
      state = state.copyWith(
        chatData: const ChatListResponse(allChats: []),
        isLoading: false,
        isFallback: false,
      );
    }
  }

  void setFilter(ChatFilter filter) {
    state = state.copyWith(filter: filter);
  }

  Future<int?> startChat(String productUrl) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      final reply = await repository.startChat(productUrl);
      loadChatList(); // 리스트 갱신
      return reply.userProductId;
    } catch (e) {
      debugPrint("❌ [Start Chat] Error: $e");
      return null;
    }
  }

  Future<ChatReply?> finalizeSurvey({
    required int userProductId,
    required int q1,
    required int q2,
    required int q3,
    required int qc,
  }) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      final reply = await repository.finalizeSurvey(
        userProductId: userProductId,
        q1: q1,
        q2: q2,
        q3: q3,
        qc: qc,
      );
      await loadChatList(); // 👈 리스트 갱신하여 백엔드 상태 동기화 및 시간 확보 [cite: 2026-02-24]
      return reply;
    } catch (e) {
      debugPrint("❌ [Finalize Survey] Error: $e");
      return null;
    }
  }

  /// finalize-survey가 에러 메시지를 돌려줬을 때, AI 첫 마디가 올 때까지 /room 폴링
  static const String _kAnalysisErrorMessage = '실패';
  static const String _kAnalysisErrorAsk = '다시 시도해줄래';

  static bool isAnalysisErrorReply(String? reply) {
    if (reply == null || reply.isEmpty) return false;
    return reply.contains(_kAnalysisErrorMessage) ||
        reply.contains(_kAnalysisErrorAsk);
  }

  static bool hasValidFirstMessage(ChatRoomDetailResponse? detail) {
    if (detail == null || detail.messages.isEmpty) return false;
    final last = detail.messages.last;
    if (last.role != 'assistant') return false;
    final content = last.message;
    return !isAnalysisErrorReply(content);
  }

  /// 에러 메시지가 아닌 AI 첫 마디가 올 때까지 5초 간격 폴링 (최대 60초).
  /// 5초마다 POST /api/chat/finalize-survey/{id} 를 같은 설문으로 재호출 → first_reply를 계속 가져옴.
  Future<bool> waitForRoomWithValidFirstMessage(
    int userProductId, {
    required int q1,
    required int q2,
    required int q3,
    required int qc,
    int maxPolls = 12,
    Duration interval = const Duration(seconds: 5),
  }) async {
    for (var i = 0; i < maxPolls; i++) {
      final reply = await finalizeSurvey(
        userProductId: userProductId,
        q1: q1,
        q2: q2,
        q3: q3,
        qc: qc,
      );
      final replyText = reply?.reply;
      final valid = replyText != null &&
          replyText.isNotEmpty &&
          !isAnalysisErrorReply(replyText);
      debugPrint(
        '🔄 [finalize-survey 폴링 ${i + 1}/$maxPolls] '
        '유효한 첫 리플라이: $valid | '
        'reply: ${replyText != null ? (replyText.length > 40 ? "${replyText.substring(0, 40)}..." : replyText) : "(null)"}',
      );
      if (valid) return true;
      if (i < maxPolls - 1) await Future.delayed(interval);
    }
    return false;
  }

  /// 채팅방이 준비될 때까지 폴링 (기본 5회, 1초 간격)
  Future<bool> waitForChatRoomReady(
    int userProductId, {
    int maxRetries = 5,
    Duration interval = const Duration(seconds: 1),
  }) async {
    final repository = ref.read(chatRepositoryProvider);
    for (var i = 0; i < maxRetries; i++) {
      final detail = await repository.getChatRoomDetailIfReady(userProductId);
      if (detail != null) return true;
      if (i < maxRetries - 1) {
        await Future.delayed(interval);
      }
    }
    return false;
  }

  Future<ChatReply?> exitChat(int userProductId) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      final reply = await repository.exitChat(userProductId);
      await loadChatList(); // 리스트 갱신 (종료 상태 반영)
      return reply;
    } catch (e) {
      debugPrint("❌ [Exit Chat] Error: $e");
      return null;
    }
  }

  Future<bool> updateChatStatus(int userProductId, bool isPurchased) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      await repository.updateStatus(userProductId, isPurchased);
      ref.invalidate(chatRoomDetailProvider(userProductId));
      await loadChatList(); // 리스트 갱신 후 반환 (채팅 목록에서 변경 상태 반영)
      return true;
    } catch (e) {
      debugPrint("❌ [Update Status] Error: $e");
      return false;
    }
  }

  /// POST /api/chat/{user_product_id}/messages/ 호출. 성공 시 ChatReply(답변) 반환, 실패 시 null.
  Future<ChatReply?> sendMessage(int userProductId, String message) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      final reply = await repository.sendMessage(userProductId, message);
      // 서버가 메시지/답변 반영할 시간을 주고 갱신
      await Future.delayed(const Duration(milliseconds: 400));
      ref.refresh(chatRoomDetailProvider(userProductId));
      return reply;
    } catch (e) {
      debugPrint("❌ [Send Message] Error: $e");
      return null;
    }
  }

  Future<bool> submitFeedback({
    required int userProductId,
    required String feedback,
    required double rating,
  }) async {
    try {
      final repository = ref.read(chatRepositoryProvider);
      await repository.submitFeedback(
        userProductId: userProductId,
        feedback: feedback,
        rating: rating,
      );
      ref.invalidate(chatRoomDetailProvider(userProductId));
      return true;
    } catch (e) {
      debugPrint("❌ [Submit Feedback] Error: $e");
      return false;
    }
  }
}

// 4. 채팅방 상세 Provider (FutureProvider)
// - 처음 진입 시 백엔드에서 아직 상품 분석/세션 준비가 안 되어 있으면 /room 이 404를 줄 수 있다.
// - 이 경우에도 화면은 "분석 중" 상태로 정상 표시되도록, 리스트 정보로 임시 헤더를 구성한다.
final chatRoomDetailProvider =
    FutureProvider.family<ChatRoomDetailResponse, int>((ref, id) async {
  final repository = ref.read(chatRepositoryProvider);

  // 1) 우선 /room 호출 시도하되, 404는 "아직 준비 중"으로 간주
  final detail = await repository.getChatRoomDetailIfReady(id);
  if (detail != null) {
    return detail;
  }

  // 2) 아직 방이 완전히 준비되지 않았다면, 채팅 리스트 정보로 임시 헤더 구성
  final chatState = ref.read(chatProvider);
  final listItem = chatState.chatData?.allChats
      .where((c) => c.userProductId == id)
      .cast<ChatListItem?>()
      .firstWhere((_) => true, orElse: () => null);

  return ChatRoomDetailResponse(
    userProductId: id,
    productName: listItem?.productName ?? '분석 중인 상품입니다...',
    productImg: listItem?.productImg,
    price: listItem?.price ?? 0,
    statusLabel: listItem?.statusLabel ?? '분석 중',
    isPurchased: listItem?.isPurchased,
    isEvaluated: false,
    messages: const [], // 메시지가 비어 있으면 DetailChatScreen에서 "분석 중" 안내 문구를 띄운다.
  );
});

// 5. Provider 선언
final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier(ref);
});
