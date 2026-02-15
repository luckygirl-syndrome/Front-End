import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/theme/app_colors.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/two_buttons.dart';
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

    final currentQ = state.questions[state.currentIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBackBar(
        currentPage: state.currentIndex,
        onBackPressed: () => notifier.handleBack(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 질문
              Text(
                'Q${state.currentIndex + 1}\n\n${state.currentTitle}',
                textAlign: TextAlign.center,
                style: AppTextStyles.ptdBold(24),
              ),

              const Spacer(),

              if (state.currentType == 'choice')
                ShopChoiceList(
                  options: state.currentOptions,
                  selectedMalls: state.selectedMalls,
                  onToggle: notifier.toggleMall,
                )
              else
                ChugumiInput(
                  onChanged: notifier.updateChugumi,
                ),

              const Spacer(),

              // --- [분리된 위젯 호출] 하단 버튼 영역 ---
              BottomButtons(
                type: state.currentType,
                onNext: () {
                  if (!state.isLastPage) {
                    notifier.nextPage();
                  } else {
                    // 1. 상태를 '완료(isFinished = true)'로 변경
                    notifier.nextPage();
                    context.go('/initial_question_start');
                  }
                },
                // '여긴 없어요' 클릭 시에도 추구미 입력으로 넘어감.
                onAlternative: () => notifier.nextPage(),
              ),

              const SizedBox(height: 33),
              AppIndicator(
                  currentPage: state.currentIndex, totalPage: state.questions.length),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
