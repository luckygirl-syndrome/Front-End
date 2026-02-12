import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

// lib/core/widgets/app_button.dart
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  
  final TextStyle? textStyle; // 👈 개별 속성 대신 스타일 통째로!

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // 1. 스타일을 변수로 빼서 가독성을 높입니다.
    final TextStyle finalTextStyle = (textStyle ?? AppTextStyles.ptdBold(20)).copyWith(
      color: textStyle?.color ?? textColor ?? AppColors.white0,
    );

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56, // 아까 노션에 정리한대로 56으로 맞췄습니다!
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          // 2. 중요! 보라색 방지용 (글자/아이콘 색상 강제 지정)
          foregroundColor: finalTextStyle.color, 
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: finalTextStyle, // 위에서 정의한 스타일 적용
        ),
      ),
    );
  }
}