import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/widgets/app_button.dart'; // 👈 절대 경로 임포트 [cite: 2026-02-17]

class TwoButtons extends StatelessWidget {
  final VoidCallback onLeftPressed;  // 👈 명칭 변경 [cite: 2026-02-17]
  final VoidCallback onRightPressed; // 👈 명칭 변경 [cite: 2026-02-17]
  final String leftText;             // 👈 명칭 변경 [cite: 2026-02-17]
  final String rightText;            // 👈 명칭 변경 [cite: 2026-02-17]
  final Color? leftBackgroundColor;  // 👈 배경색 커스텀 추가 [cite: 2026-02-17]
  final Color? rightBackgroundColor; // 👈 배경색 커스텀 추가 [cite: 2026-02-17]
  final double gap;
  final double borderRadius;

  const TwoButtons({
    super.key,
    required this.onLeftPressed,
    required this.onRightPressed,
    this.leftText = '싫어요', // 기존 로직에 맞춰 기본값 변경 [cite: 2026-02-17]
    this.rightText = '좋아요', 
    this.leftBackgroundColor,
    this.rightBackgroundColor,
    this.gap = 20,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. 왼쪽 버튼 영역
        Expanded(
          child: AppButton(
            text: leftText,
            onPressed: onLeftPressed,
            backgroundColor: leftBackgroundColor ?? AppColors.secondaryMain, 
            borderRadius: borderRadius,
          ),
        ),
        SizedBox(width: gap),
        Expanded(
          child: AppButton(
            text: rightText,
            onPressed: onRightPressed,
            backgroundColor: rightBackgroundColor ?? AppColors.primaryMain, 
            borderRadius: borderRadius,
          ),
        ),
      ],
    );
  }
}