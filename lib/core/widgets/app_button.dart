import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

// lib/core/widgets/app_button.dart
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Color? shadowColor; 
  final List<BoxShadow>? boxShadow;
  final double? borderWidth;
  
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
    this.shadowColor,
    this.boxShadow,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    final Color finalBgColor = backgroundColor ?? AppColors.primaryMain;
    final TextStyle finalTextStyle = (textStyle ?? AppTextStyles.ptdBold(20)).copyWith(
      color: textStyle?.color ?? textColor ?? AppColors.white,
    );

    return Container(
      // 👈 1. Container의 decoration에서 boxShadow를 명백히 처리합니다. [cite: 2026-02-13]
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        boxShadow: boxShadow, 
      ),
      child: SizedBox(
        width: width ?? double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: finalBgColor,
            foregroundColor: finalTextStyle.color,
            // 👈 2. 중요: Container에서 그림자를 그리므로 버튼 자체 elevation은 0이어야 합니다. [cite: 2026-01-02]
            elevation: 0, 
            shadowColor: Colors.transparent, // 혹시 모를 잔상을 위해 투명화 [cite: 2026-02-13]
            
            padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
            side: BorderSide(
              color: borderColor ?? finalBgColor, 
              width: borderWidth ?? 1, // 두께는 기본 1로 고정
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: finalTextStyle,
          ),
        ),
      ),
    );
  }
}