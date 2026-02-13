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
  final Color? borderColor;
  
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
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    // 배경색 결정 (기본값 설정)
    final Color finalBgColor = backgroundColor ?? AppColors.primaryMain;

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
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14),

          // 2. 테두리 설정: borderColor가 없으면 배경색과 똑같은 색을 줍니다.
          // 이렇게 하면 기본적으로는 선이 안 보이고, borderColor를 주면 그제야 선이 보입니다.
          side: BorderSide(
            color: borderColor ?? finalBgColor, 
            width: 1, // 두께는 기본 1로 고정
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),

          // 패딩이 정확히 먹히도록 최소 사이즈 제약 해제
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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