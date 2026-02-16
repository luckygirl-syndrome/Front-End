import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_back_bar.dart';
import '../../../core/widgets/app_indicator.dart';
import '../provider/initial_question_provider.dart';
import '../widgets/bottom_buttons.dart';
import '../widgets/chugumi_input.dart';
import '../widgets/shop_choice_list.dart';

class InitialQuestionScreen extends ConsumerWidget {
  const InitialQuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. 새로운 프로바이더 구독
    final state = ref.watch(initialQuestionProvider);
    final notifier = ref.read(initialQuestionProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBackBar(
        currentPage: state.currentIndex,
        onBackPressed: () => notifier.handleBack(
          onExit: () => context.pop(), // 첫 페이지면 뒤로가기
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 질문 타이틀 영역
              _QuestionHeader(
                index: state.currentIndex,
                title: state.currentTitle,
              ),

              const Spacer(),

              // 💡 핵심: 현재 타입에 맞는 입력 폼 (분리됨)
              _QuestionInputForm(state: state, notifier: notifier),

              const Spacer(),

              // --- [분리된 위젯 호출] 하단 버튼 영역 ---
              BottomButtons(
                type: state.currentType,
                onNext: () => notifier.handleNext(
                  onAllFinished: () => context.go('/initial_question_start'),
                ),
                // '여긴 없어요' 클릭 시에도 추구미 입력으로 넘어감.
                onAlternative: () => notifier.nextPage(),
              ),

              const SizedBox(height: 33),
              AppIndicator(
                  currentPage: state.currentIndex,
                  totalPage: state.questions.length),
              const SizedBox(height: 20),
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
    return Text(
      'Q${index + 1}\n\n$title',
      textAlign: TextAlign.center,
      style: AppTextStyles.ptdBold(24),
    );
  }
}

/// [2] 타입별 입력 폼 판별 위젯
class _QuestionInputForm extends StatelessWidget {
  final InitialQuestionState state;
  final InitialQuestionNotifier notifier;

  const _QuestionInputForm({required this.state, required this.notifier});

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
    return ChugumiInput(onChanged: notifier.updateChugumi);
  }
}
