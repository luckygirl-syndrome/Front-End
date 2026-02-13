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
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  
  final TextStyle? textStyle; // 👈 개별 속성 대신 스타일 통째로!

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.borderRadius,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // 1. 스타일을 변수로 빼서 가독성을 높입니다.
    final TextStyle finalTextStyle = (textStyle ?? AppTextStyles.ptdBold(20)).copyWith(
      color: textStyle?.color ?? textColor ?? AppColors.white,
    );

    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryMain,
          // 2. 중요! 보라색 방지용 (글자/아이콘 색상 강제 지정)
          foregroundColor: finalTextStyle.color, 
          elevation: 0,
          // 4의 배수 시스템 적용: 기본 상하 16)
          padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
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