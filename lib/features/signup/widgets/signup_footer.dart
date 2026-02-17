import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_indicator.dart';

/// [3] SignupFooter: 하단 고정 버튼 및 인디케이터
/// 페이지 번호 표시와 '다음' 버튼 활성화 상태를 관리합니다.
class SignupFooter extends StatelessWidget {
  final int currentPage;
  final bool isPageValid;
  final VoidCallback onNextPressed;

  const SignupFooter({
    super.key,
    required this.currentPage,
    required this.isPageValid,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: currentPage == 3 ? '가보자고~!' : '다음',
          // 유효하지 않으면 버튼을 비활성화(null) 처리합니다.
          onPressed: isPageValid ? onNextPressed : null,
        ),
        const SizedBox(height: 20),
        AppIndicator(currentPage: currentPage, totalPage: 4),
        const SizedBox(height: 20),
      ],
    );
  }
}