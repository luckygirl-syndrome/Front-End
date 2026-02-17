import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// [2] SignupGuideItem: 유효성 검사 결과를 시각적으로 표현
/// 조건(isValid)에 따라 아이콘과 텍스트의 색상을 변경합니다.
class SignupGuideItem extends StatelessWidget {
  final String text;
  final bool isValid;

  const SignupGuideItem({super.key, required this.text, required this.isValid});

  @override
  Widget build(BuildContext context) {
    final color = isValid ? AppColors.primaryMain : AppColors.lightGrey;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check, size: 14, color: color),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.ptdRegular(12).copyWith(color: color)),
        ],
      ),
    );
  }
}