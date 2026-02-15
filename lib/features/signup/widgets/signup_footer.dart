import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_indicator.dart';

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
          // 유효하지 않을 때 빈 함수를 주어 색상 유지
          onPressed: isPageValid ? onNextPressed : () {},
        ),
        const SizedBox(height: 20),
        AppIndicator(currentPage: currentPage, totalPage: 4),
        const SizedBox(height: 20),
      ],
    );
  }
}