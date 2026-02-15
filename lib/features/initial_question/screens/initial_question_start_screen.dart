import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/widgets/app_back_bar.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/two_buttons.dart';
import '../provider/initial_question_provider.dart';
import '../widgets/background_initial_question.dart'; // 이전에 만든 섀도우 버튼

class InitialQuestionStartScreen extends ConsumerWidget {
  const InitialQuestionStartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // 1. 완료 여부 상태 확인
    final state = ref.watch(initialQuestionProvider);
    final isFinished = state.isFinished;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack( // 1. 배경과 콘텐츠를 겹치기 위해 Stack 사용
        children: [
          // 1. 배경 영역 (분리된 위젯)
          const InitialQuestionBackground(),

          // 2. ⭐ 캐릭터 이미지를 화면 전체의 중앙에 배치
          Center(
            child: Image.asset(
              isFinished 
                  ? 'assets/images/initial_question_cat_end.png' // 마지막 사진
                  : 'assets/images/initial_question_cat.png', // 시작 사진
              height: 96,
            ),
          ),

          // 3. 실제 콘텐츠 (이것만 SafeArea로 감싸서 보호)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    isFinished
                        ? '진짜로 끝났어요\n\n또바바와 함께\n또 사기 전에 또바!'
                        : '거의 다 끝났어요\n\n또바가 OO 님을 더 잘 알기 위해\n딱 2가지만 더 물어볼게요!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ptdBold(24),
                  ),
                  
                  const Spacer(),

                  // 4. 하단 버튼 영역 분기
                  if (isFinished)
                    // 마지막 화면: 버튼 1개
                    SizedBox(
                      width: double.infinity,
                      child: AppButton(
                        text: '가보자고~!',
                        onPressed: () => context.go('/home'),
                        backgroundColor: AppColors.primaryMain,
                      ),
                    )
                  else
                    // 시작 화면: 버튼 2개
                    TwoButtons(
                      onDislike: () => context.go('/initial_question_no_like'),
                      onLike: () => context.go('/initial_question'),
                      dislikeText: '이젠 힘들어요',
                      likeText: '좋아요',
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}