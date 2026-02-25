import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/widgets/app_indicator.dart';

import 'app_backbar.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class QuestionBase extends StatelessWidget {
  final String question;
  final int currentIndex;
  final int totalSteps;
  final Widget content; // 중앙에 들어갈 버튼들 or 입력창
  final Widget? bottomButton; // (선택사항) 2, 3번 스크린의 하단 버튼
  final VoidCallback? onBackPressed;
  final String? title; // AppBar 제목

  const QuestionBase(
      {super.key,
      required this.question,
      required this.currentIndex,
      required this.totalSteps,
      required this.content,
      this.bottomButton,
      this.onBackPressed, // 뒤로가기 로직을 외부에서 주입받음
      this.title,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBackBar(
        title: title,
        currentPage: currentIndex,
        onBackPressed: onBackPressed ??
            () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/home'); // 더 이상 pop할 게 없으면 홈으로
              }
            },
      ), // 기존 앱바 활용
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 60, 32, 16),
          child: Column(
            children: [
              // [1] 질문 영역 - 항상 Bold/24
              Text(
                'Q${currentIndex + 1}\n\n$question',
                textAlign: TextAlign.center,
                style: AppTextStyles.ptdBold(24),
              ),

              // [2] 위쪽 Spacer - 질문과 콘텐츠 사이
              const Spacer(),

              // [3] 컨텐츠 영역 (버튼들)
              content,

              // [4] 아래쪽 Spacer - 콘텐츠와 인디케이터 사이
              const Spacer(),

              // [6] 하단 영역
              if (bottomButton != null) ...[
                bottomButton!,
                const SizedBox(height: 20),
              ],

              // [7] 인디케이터
              AppIndicator(currentPage: currentIndex, totalPage: totalSteps),
            ],
          ),
        ),
      ),
    );
  }
}
