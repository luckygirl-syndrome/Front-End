import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

// lib/core/widgets/app_button.dart
class AppButton extends StatelessWidget {
  final String text;
  final String? title; // 1. 제목 파라미터 추가
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
  final bool fitContent; // 💡 내용물에 딱 맞게 크기 조절 여부

  const AppButton({
    super.key,
    required this.text,
    this.title,
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
    this.fitContent = false, // 기본값은 기존처럼 확장 (false)
  });

  @override
  Widget build(BuildContext context) {
    // ... (기존 색상 설정 로직)
    final Color finalBgColor = backgroundColor ?? AppColors.primaryMain;
    final Color finalBorderColor = borderColor ?? Colors.transparent;
    final TextStyle finalTextStyle =
        (textStyle ?? AppTextStyles.ptdBold(20)).copyWith(
      color: textStyle?.color ?? textColor ?? AppColors.white,
    );
    final TextStyle titleStyle = AppTextStyles.ptdBold(24).copyWith(
      color: textColor ?? AppColors.white,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        boxShadow: boxShadow,
      ),
      child: SizedBox(
        // 💡 fitContent가 true이면 width를 null로 주어 내용물에 맞춤
        // width가 명시적으로 있으면 그 값을 우선
        width: width ?? (fitContent ? null : double.infinity),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: finalBgColor,
            foregroundColor: finalTextStyle.color,
            // 👈 2. 중요: Container에서 그림자를 그리므로 버튼 자체 elevation은 0이어야 합니다. [cite: 2026-01-02]
            elevation: 0,
            shadowColor:
                Colors.transparent, // 혹시 모를 잔상을 위해 투명화 [cite: 2026-02-13]

            padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
            // 👈 2. borderColor가 없으면 transparent가 들어가서 테두리가 보이지 않습니다.
            side: BorderSide(
              color: finalBorderColor,
              width: borderColor == null ? 0 : (borderWidth ?? 1),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: onPressed,
          child: title != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title!, style: titleStyle),
                    const SizedBox(height: 4),
                    Text(text, style: finalTextStyle),
                  ],
                )
              : Text(
                  text,
                  style: finalTextStyle,
                ),
        ),
      ),
    );
  }
}
