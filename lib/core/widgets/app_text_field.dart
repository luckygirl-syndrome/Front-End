import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  // 1. 생성자에 파라미터 추가
  final Function(String)? onSubmitted; // 이 줄 추가
  final Function(String)? onChanged; // 이 줄 추가

  final String hint;
  final bool obscureText;
  final TextEditingController? controller;
  final double? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  // 1. 패딩을 외부에서 결정할 수 있도록 속성 추가
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon;
  // ⭐ 아이콘 크기를 조절할 수 있는 변수 추가 (기본값 20)
  final double iconSize;

  // ⭐ 가려졌을 때와 보일 때의 아이콘을 직접 받을 수 있게 추가
  final Widget? obscureIcon;
  final Widget? visibleIcon;

  // 개별 속성 대신 텍스트 스타일 통째로 관리
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const AppTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.iconSize = 20,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.textStyle,
    this.hintStyle,
    this.contentPadding,
    this.onSubmitted,
    this.onChanged,
    this.suffixIcon,
    this.obscureIcon,
    this.visibleIcon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController _internalController;
  bool _hasText = false;
  // ⭐ 해결책 1: late를 제거하고 기본값으로 false를 줍니다.
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    // 1. 외부 컨트롤러가 있으면 쓰고 없으면 내부에서 생성
    _internalController = widget.controller ?? TextEditingController();

    // 2. 텍스트가 입력될 때마다 상태를 체크해서 테두리 색을 바꿉니다.
    _internalController.addListener(_updateState);

    // 초기값 있을 경우 대응
    _hasText = _internalController.text.isNotEmpty;

    // 초기값 설정
    _isObscured = widget.obscureText;
  }

  void _updateState() {
    if (_internalController.text.isNotEmpty != _hasText) {
      // ⭐ 위젯이 화면에서 제거된 상태라면 setState를 실행하지 않도록 방어!
      if (!mounted) return;

      setState(() {
        _hasText = _internalController.text.isNotEmpty;
      });
    }
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 페이지가 전환될 때 obscureText 값이 바뀌면 내부 상태도 동기화
    if (oldWidget.obscureText != widget.obscureText) {
      setState(() {
        _isObscured = widget.obscureText;
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

  Widget? _buildSuffixIcon() {
    if (widget.suffixIcon != null) return widget.suffixIcon;

    if (widget.obscureText) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
        child: Container(
          padding: const EdgeInsets.only(right: 24),
          color: Colors.transparent,
          child: SizedBox(
            // ⭐ SizedBox로 크기를 확실하게 고정합니다.
            width: _isObscured ? widget.iconSize : widget.iconSize * 0.7,
            child: Image.asset(
              _isObscured
                  ? 'assets/images/eye_1.png'
                  : 'assets/images/eye_2.png',
              // ⭐ 이미지가 지정된 크기에 꽉 차도록 설정
              fit: BoxFit.contain,
              color: AppColors.lightGrey,
            ),
          ),
        ),
      );
    }
    return null;
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
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        obscureText: _isObscured,
        textAlignVertical: TextAlignVertical.center, // 텍스트 수직 중앙 정렬
        style: finalTextStyle,
        decoration: InputDecoration(
          suffixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          hintText: widget.hint,
          hintStyle: finalHintStyle,

          // 핵심: isDense를 true로 줘야 기본 여백이 제거되어
          // 우리가 설정한 contentPadding이 정확하게 먹힙니다.
          isDense: true,

          // 피그마 수치대로 넣되, 실제 렌더링을 보며 상하(vertical) 값을 조금씩 조정하세요.
          // 외부에서 주면 쓰고, 안 주면 기본값(14)을 쓰도록 설정
          contentPadding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

          // ⭐ 결정된 아이콘 적용
          suffixIcon: _buildSuffixIcon(),

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