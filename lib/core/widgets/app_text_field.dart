import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor; // 노란색 등 포인트 컬러용
  final double? height;

  const AppTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.height,
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
        ? (widget.focusedBorderColor ?? AppColors.primary) 
        : (widget.borderColor ?? AppColors.grey0);

    return SizedBox(
      height: widget.height ?? 40,
      child: TextField(
        controller: _internalController,
        obscureText: widget.obscureText,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.ptdRegular(widget.fontSize ?? 16).copyWith(
          color: AppColors.black0,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: AppTextStyles.ptdRegular(widget.fontSize ?? 16).copyWith(
            color: AppColors.grey0,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          
          // 4. 포커스가 빠졌을 때: 값이 있으면 노란색 유지!
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(
              color: activeBorderColor, 
              width: 1,
            ),
          ),
          
          // 5. 포커스 되었을 때: 무조건 지정한 강조색
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            borderSide: BorderSide(
              color: widget.focusedBorderColor ?? AppColors.primary, 
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}