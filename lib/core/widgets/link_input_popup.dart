import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_button.dart';
import 'app_text_field.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class LinkInputPopup extends StatefulWidget {
  final String title; // 팝업 제목
  final String hint; // 입력창 힌트
  final String buttonText; // 버튼 텍스트

  const LinkInputPopup({
    super.key,
    this.title = '어떤 옷이\n당신의 구미를 당기나요?', // 기본값 설정
    this.hint = '링크를 입력해 주세요',
    this.buttonText = '확인',
  });

  @override
  State<LinkInputPopup> createState() => _LinkInputPopupState();
}

class _LinkInputPopupState extends State<LinkInputPopup> {
  final TextEditingController _controller = TextEditingController();
  bool _isFilled = false;

  @override
  void initState() {
    super.initState();
    // 텍스트 감지하여 버튼 상태 업데이트
    _controller.addListener(() {
      final isNotEmpty = _controller.text.isNotEmpty;
      if (isNotEmpty != _isFilled) {
        setState(() => _isFilled = isNotEmpty);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // 1. Modifier.padding(horizontal = 32.dp) 반영
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 닫기 버튼
          IconButton(
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero, // 터치 영역 최적화
            constraints: const BoxConstraints(), // 기본 패딩 제거
            icon: SvgPicture.asset(
              // 👈 Image.asset 대신 SvgPicture.asset 사용
              'assets/icons/close_button.svg',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(height: 12),

          // 2. 메인 팝업 컨테이너 (height: 274.dp)
          Container(
            width: double.infinity,
            height: 274,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title, // 👈 주입받은 제목 사용
                  textAlign: TextAlign.center,
                  style: AppTextStyles.ptdBold(20).copyWith(height: 1.4),
                ),
                const SizedBox(height: 24),
                AppTextField(
                  hint: widget.hint, // 👈 주입받은 힌트 사용
                  controller: _controller,
                  borderRadius: 12,
                ),
                const SizedBox(height: 16),
                AppButton(
                  text: widget.buttonText, // 👈 주입받은 버튼 텍스트 사용
                  onPressed: _isFilled
                      ? () => Navigator.pop(context, _controller.text)
                      : () {},
                  backgroundColor:
                      _isFilled ? AppColors.primaryMain : AppColors.lightGrey,
                  borderRadius: 12,
                  textStyle: AppTextStyles.ptdBold(16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
