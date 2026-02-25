import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_backbar.dart';
import '../../../core/widgets/app_indicator.dart';
import '../provider/initial_question_provider.dart';
import '../widgets/bottom_buttons.dart';
import '../widgets/chugumi_input.dart';
import '../widgets/shop_choice_list.dart';

class InitialQuestionScreen extends ConsumerWidget {
  final String? from;
  const InitialQuestionScreen({super.key, this.from});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. 새로운 프로바이더 구독
    final state = ref.watch(initialQuestionProvider);
    final notifier = ref.read(initialQuestionProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBackBar(
        title: '기본 질문',
        currentPage: state.currentIndex,
        onBackPressed: () => notifier.handleBack(
          onExit: () => context.pop(), // 첫 페이지면 뒤로가기
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 60, 32, 16),
          child: Column(
            children: [
              // 질문 타이틀 영역
              _QuestionHeader(
                index: state.currentIndex,
                title: state.currentTitle,
              ),

              const SizedBox(height: 20),

              // 💡 핵심: 현재 타입에 맞는 입력 폼 (분리됨)
              // 💡 핵심: 현재 타입에 맞는 입력 폼 (분리됨)
              _QuestionInputForm(
                state: state,
                notifier: notifier,
                onNext: () => notifier.handleNext(
                  onAllFinished: () {
                    if (from == 'my') {
                      context.push('/taste_update_complete');
                    } else {
                      context.push('/initial_question_start');
                    }
                  },
                ),
              ),

              const Spacer(),

              // --- [분리된 위젯 호출] 하단 버튼 영역 ---
              BottomButtons(
                type: state.currentType,
                isLastPage: state.isLastPage,
                onNext: () => notifier.handleNext(
                  onAllFinished: () {
                    if (from == 'my') {
                      context.push('/taste_update_complete');
                    } else {
                      context.push('/initial_question_start');
                    }
                  },
                ),
                // '여긴 없어요' 클릭 시에도 추구미 입력으로 넘어감.
                onAlternative: () => notifier.nextPage(),
              ),

              const SizedBox(height: 16),
              AppIndicator(
                  currentPage: state.currentIndex,
                  totalPage: state.questions.length),
            ],
          ),
        ),
      ),
    );
  }
}

/// [1] 질문 헤더
class _QuestionHeader extends StatelessWidget {
  final int index;
  final String title;
  const _QuestionHeader({required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    // Q4(index 3)일 때는 Bold/16, 나머지는 Bold/20
    final isLastQuestion = index == 3;
    final textStyle = isLastQuestion 
        ? AppTextStyles.ptdBold(16)
        : AppTextStyles.ptdBold(20);
    
    return Text(
      'Q${index + 1}\n\n$title',
      textAlign: TextAlign.center,
      style: textStyle,
    );
  }
}

/// [2] 타입별 입력 폼 판별 위젯
/// [2] 타입별 입력 폼 판별 위젯
class _QuestionInputForm extends StatelessWidget {
  final InitialQuestionState state;
  final InitialQuestionNotifier notifier;
  final VoidCallback onNext; // 추가: 다음으로 넘어가는 콜백

  const _QuestionInputForm({
    required this.state,
    required this.notifier,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    // Screen 대신 여기서 타입을 판별하여 위젯을 리턴합니다.
    if (state.currentType == 'choice') {
      return ShopChoiceList(
        options: state.currentOptions,
        selectedMalls: state.selectedMalls,
        onToggle: notifier.toggleMall,
      );
    }
    // ChugumiInput 사용 시 onNext 전달
    return ChugumiInput(
      initialValue: state.chugumiText,
      onChanged: notifier.updateChugumi,
      onNext: onNext,
    );
  }
}
