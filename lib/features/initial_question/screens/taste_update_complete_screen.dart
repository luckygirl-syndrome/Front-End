import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
// App bar removed per design change
import 'package:ttobaba/core/widgets/app_button.dart';

/// 마이페이지에서 취향 다시 설정 완료 후 보여주는 화면
class TasteUpdateCompleteScreen extends StatelessWidget {
  const TasteUpdateCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // no appBar: full-bleed look as requested
      body: Stack(
        children: [
          // 1. 배경 (그라데이션) — initial_question_start_screen과 동일
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.white,
                    AppColors.white,
                    AppColors.primaryMain,
                    AppColors.white,
                  ],
                  stops: [0.0, 0.35, 0.351, 0.9],
                ),
              ),
            ),
          ),

          // 2. 중앙 아바타 이미지 (대체)
          Center(
            child: Image.asset(
              'assets/images/avatars/image 201-1.png',
              height: 120,
            ),
          ),

          // 3. 텍스트 + 버튼
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    '취향이\n업데이트 되었어요',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ptdBold(24),
                  ),
                  const Spacer(),
                  AppButton(
                    text: '좋았어~!',
                    onPressed: () => context.go('/my_page'),
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
