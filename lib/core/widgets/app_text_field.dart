import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final double? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;

  // 개별 속성 대신 텍스트 스타일 통째로 관리
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const AppTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.textStyle,
    this.hintStyle,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _internalController;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    // 1. 외부 컨트롤러가 있으면 쓰고 없으면 내부에서 생성
    _internalController = widget.controller ?? TextEditingController();

    // 2. 텍스트가 입력될 때마다 상태를 체크해서 테두리 색을 바꿉니다.
    _internalController.addListener(_updateState);

    // 초기값 있을 경우 대응
    _hasText = _internalController.text.isNotEmpty;
  }

  void _updateState() {
    if (_internalController.text.isNotEmpty != _hasText) {
      setState(() {
        _hasText = _internalController.text.isNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    // 내부에서 만든 컨트롤러인 경우에만 dispose
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3. 값이 있으면 노란색(focusedBorderColor), 없으면 기본 회색(borderColor)
    final activeBorderColor = _hasText
        ? (widget.focusedBorderColor ?? AppColors.primaryMain)
        : (widget.borderColor ?? AppColors.lightGrey);

    // 1. 입력되는 글자의 스타일 (기본 검정색)
    final TextStyle finalTextStyle = widget.textStyle ??
        AppTextStyles.ptdRegular(16).copyWith(
          color: AppColors.black, // 입력 글자는 확실히 검정!
        );

    // 2. ⭐ 핵심: 힌트 스타일 자동 설정 로직
    // 밖에서 hintStyle을 안 주면 -> textStyle의 설정을 따라가되 색상만 lightGrey로 바꿉니다.
    // 만약 textStyle도 안 주면 -> 기본 16 사이즈에 lightGrey를 입힙니다.
    final TextStyle finalHintStyle =
        (widget.hintStyle ?? finalTextStyle).copyWith(
      color: AppColors.lightGrey,
    );

    return SizedBox(
      child: TextField(
        controller: _internalController,
        obscureText: widget.obscureText,
        textAlignVertical: TextAlignVertical.center, // 텍스트 수직 중앙 정렬
        style: finalTextStyle,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: finalHintStyle,

          // 피그마 수치대로 넣되, 실제 렌더링을 보며 상하(vertical) 값을 조금씩 조정하세요.
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(color: activeBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(
                color: widget.focusedBorderColor ?? AppColors.primaryMain),
          ),
        ),
      ),
    );
  }
}
