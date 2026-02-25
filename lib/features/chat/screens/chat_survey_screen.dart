import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/question_base.dart';
import 'package:ttobaba/features/chat/providers/chat_provider.dart';

class ChatSurveyScreen extends ConsumerStatefulWidget {
  final int userProductId;
  const ChatSurveyScreen({super.key, required this.userProductId});

  @override
  ConsumerState<ChatSurveyScreen> createState() => _ChatSurveyScreenState();
}

class _ChatSurveyScreenState extends ConsumerState<ChatSurveyScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  int _currentIndex = 0;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Survey answers (q1, q2, q3, qc)
  // Mapping logic will be needed if the UI values differ from API requirements (integers)
  final Map<String, int> _answers = {
    'q1': 1,
    'q2': 1,
    'q3': 1,
    'qc': 1,
  };

  final List<Map<String, dynamic>> _surveyQuestions = [
    {
      'key': 'q1',
      'title': '기본 질문',
      'question': '이 옷,\n장바구니/찜에 담은 지\n얼마나 됐어요?',
      'options': [
        {'text': '방금 막 담았어요', 'value': 1, 'color': AppColors.secondaryDark},
        {'text': '1~2일 이내로 담았어요', 'value': 2, 'color': AppColors.secondaryMain},
        {'text': '일주일 이내로 담았어요', 'value': 3, 'color': AppColors.secondaryLight},
        {'text': '일주일 이상 됐어요', 'value': 4, 'color': AppColors.primaryLight},
        {'text': '한 달 이상 됐어요', 'value': 5, 'color': AppColors.primaryMain},
      ],
    },
    {
      'key': 'q2',
      'title': '기본 질문',
      'question': '또바한테\n연락한 이유가\n무엇인가요?',
      'options': [
        {'text': '사도 되는지 확인받고 싶어요', 'value': 1},
        {'text': '그냥 이 옷 어떤가 궁금해요', 'value': 2},
        {'text': '오래 고민했는데 결정이 안 나요', 'value': 3},
        {'text': '사고나서 후회할까봐 걱정돼요', 'value': 4},
      ],
    },
    {
      'key': 'q3',
      'title': '기본 질문',
      'question': '이 옷,\n이미 사기로 마음을 정했나요?\n아니면 확신이 부족한가요?',
      'options': [
        {'text': '비슷한 옷이 많아서 고민돼요', 'value': 1},
        {'text': '장바구니 중 제일 마음에 들어요', 'value': 2},
        {'text': '코디까지 생각해둬서 잘 입을 것 같아요', 'value': 3},
        {'text': '혹시 더 나은 게 있을까 불안해요', 'value': 4},
      ],
    },
    {
      'key': 'qc',
      'title': '기본 질문',
      'question': '이 옷의 어떤 점이\n당신의 마음을 뺏나요?',
      'type': 'grid',
      'options': [
        {'text': '가성비', 'value': 1},
        {'text': '시즌오프 세일\n품절 임박', 'value': 2},
        {'text': '요즘 유행템 같아서\n연예인이 입었대서', 'value': 3},
        {'text': '퀄리티가\n좋을 것 같아서', 'value': 4},
        {'text': 'MD, 인플루언서가\n픽했대서', 'value': 5},
        {'text': '모델이 입은 핏이\n예뻐서', 'value': 6},
        {'text': '배송이 빨리\n와야 해서', 'value': 7},
      ],
    },
  ];

  void _onNext() async {
    if (_currentIndex < _surveyQuestions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _isSubmitting = true;
      });
      debugPrint('[DEBUG] 마지막 질문 답변 버튼 클릭됨. 처리 시작');
      debugPrint('[DEBUG] userProductId: ${widget.userProductId}');
      debugPrint(
          '[DEBUG] Answers: q1=${_answers['q1']}, q2=${_answers['q2']}, q3=${_answers['q3']}, qc=${_answers['qc']}');
      final reply = await ref.read(chatProvider.notifier).finalizeSurvey(
            userProductId: widget.userProductId,
            q1: _answers['q1']!,
            q2: _answers['q2']!,
            q3: _answers['q3']!,
            qc: _answers['qc']! > 7 ? 7 : _answers['qc']!,
          );
      debugPrint('[DEBUG] finalizeSurvey success: ${reply != null}');

      if (reply != null && mounted) {
        final qc = _answers['qc']! > 7 ? 7 : _answers['qc']!;
        ref.read(lastSurveyAnswersProvider.notifier).setAnswers(
              widget.userProductId,
              SurveyAnswers(
                q1: _answers['q1']!,
                q2: _answers['q2']!,
                q3: _answers['q3']!,
                qc: qc,
              ),
            );
        final isErrorReply = ChatNotifier.isAnalysisErrorReply(reply.reply);
        if (isErrorReply) {
          // AI 첫 마디 대신 에러 문구가 왔으면, 준비될 때까지 로딩 유지 후 폴링
          debugPrint('[DEBUG] finalizeSurvey returned error message, waiting for valid room (max 60s)');
          final ready = await ref.read(chatProvider.notifier).waitForRoomWithValidFirstMessage(
                widget.userProductId,
                q1: _answers['q1']!,
                q2: _answers['q2']!,
                q3: _answers['q3']!,
                qc: _answers['qc']! > 7 ? 7 : _answers['qc']!,
              );
          if (!mounted) return;
          setState(() {
            _isSubmitting = false;
          });
          if (ready) {
            debugPrint('[DEBUG] Room ready with valid first message, navigating to /chat/${widget.userProductId}');
            context.pushReplacement('/chat/${widget.userProductId}');
          } else {
            context.pushReplacement('/chat/${widget.userProductId}');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('분석에 시간이 걸리고 있어요. 채팅방에서 다시 시도해 주세요.'),
              ),
            );
          }
        } else {
          setState(() {
            _isSubmitting = false;
          });
          debugPrint('[DEBUG] finalizeSurvey success, navigating directly to /chat/${widget.userProductId}');
          context.pushReplacement('/chat/${widget.userProductId}');
        }
      } else if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
        debugPrint('[DEBUG] finalizeSurvey failed, showing snackbar');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("설문 제출에 실패했습니다. 다시 시도해 주세요.")),
        );
      }
    }
  }

  void _onBack() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQ = _surveyQuestions[_currentIndex];
    final key = currentQ['key'] as String;
    final type = currentQ['type'] ?? 'list';
    final options = currentQ['options'] as List<Map<String, dynamic>>;

    return Stack(
      children: [
        QuestionBase(
          title: '기본 질문',
          question: currentQ['question'],
          currentIndex: _currentIndex,
          totalSteps: _surveyQuestions.length,
          onBackPressed: _onBack,
          content: type == 'grid'
              ? _buildGridContent(key, options)
              : _buildListContent(key, options),
        ),
        if (_isSubmitting)
          Positioned.fill(
            child: Material(
              color: Colors.black.withOpacity(0.4),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // [1] 흰색 배경 상자 (전체가 돌아가야 함)
                    RotationTransition(
                      turns: _animationController,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                    // [2] 텍스트 (ExtraBold/24, White)
                    Text(
                      '또바가 열심히\n분석하고 있어요',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.ptdExtraBold(24).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildListContent(String key, List<Map<String, dynamic>> options) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: options.map((opt) {
        final value = opt['value'] as int;
        final isSelected = _answers[key] == value;
        final color = (opt['color'] as Color?) ?? AppColors.primaryMain;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              setState(() {
                _answers[key] = value;
              });
              // Auto-next for single choice list for better UX
              Future.delayed(const Duration(milliseconds: 200), _onNext);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  opt['text'],
                  style: AppTextStyles.ptdBold(20).copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGridContent(String key, List<Map<String, dynamic>> options) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.2,
          physics: const NeverScrollableScrollPhysics(),
          children: options.map((opt) {
            final value = opt['value'] as int;
            final isSelected = _answers[key] == value;
            const color = AppColors.primaryMain;

            return InkWell(
              onTap: () {
                setState(() {
                  _answers[key] = value;
                });
                // Auto-next for better UX
                Future.delayed(const Duration(milliseconds: 200), _onNext);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(
                  child: Text(
                    opt['text'],
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ptdBold(16).copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
