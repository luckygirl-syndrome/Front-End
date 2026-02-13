import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

// 유효성 검사 가이드 라인
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