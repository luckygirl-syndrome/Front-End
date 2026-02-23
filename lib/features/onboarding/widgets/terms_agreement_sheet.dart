import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

class TermsAgreementSheet extends StatefulWidget {
  const TermsAgreementSheet({super.key});

  @override
  State<TermsAgreementSheet> createState() => _TermsAgreementSheetState();
}

class _TermsAgreementSheetState extends State<TermsAgreementSheet> {
  bool _isAllChecked = false;
  bool _isAgeChecked = false;
  bool _isPrivacyChecked = false;

  void _toggleAll() {
    setState(() {
      _isAllChecked = !_isAllChecked;
      _isAgeChecked = _isAllChecked;
      _isPrivacyChecked = _isAllChecked;
    });
  }

  void _updateCheckState() {
    setState(() {
      _isAllChecked = _isAgeChecked && _isPrivacyChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool canProceed = _isAgeChecked && _isPrivacyChecked;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.only(left: 32, right: 32, top: 44, bottom: 20),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '또바바 이용을 위해\n동의가 필요해요',
              style: AppTextStyles.ptdBold(24).copyWith(height: 1.4),
            ),
            const SizedBox(height: 44),

            // 모두 동의 박스
            _buildCheckItem(
              text: '모두 동의해요',
              isChecked: _isAllChecked,
              onTap: _toggleAll,
              isBordered: true,
              textStyle: AppTextStyles.ptdRegular(16).copyWith(
                color: _isAllChecked ? AppColors.black : AppColors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // 필수 1
            _buildCheckItem(
              text: '[필수] 만 14세 이상',
              isChecked: _isAgeChecked,
              onTap: () {
                setState(() {
                  _isAgeChecked = !_isAgeChecked;
                  _updateCheckState();
                });
              },
            ),
            const SizedBox(height: 20),

            // 필수 2
            _buildCheckItem(
              text: '[필수] 개인정보 수집 및 이용',
              isChecked: _isPrivacyChecked,
              showArrow: true,
              onTap: () {
                setState(() {
                  _isPrivacyChecked = !_isPrivacyChecked;
                  _updateCheckState();
                });
              },
            ),
            const SizedBox(height: 32),

            // 확인 버튼
            AppButton(
              text: '확인',
              backgroundColor:
                  canProceed ? AppColors.black : AppColors.lightGrey,
              textStyle: AppTextStyles.ptdBold(16).copyWith(
                color: AppColors.white,
              ),
              borderRadius: 8,
              onPressed: canProceed
                  ? () {
                      Navigator.pop(context);
                      try {
                        context.push('/login');
                      } catch (e) {
                        debugPrint(
                            'standalone test mode: context.push route not found');
                      }
                    }
                  : () {}, // 비활성 시 아무 작업 안 함
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem({
    required String text,
    required bool isChecked,
    required VoidCallback onTap,
    bool showArrow = false,
    bool isBordered = false,
    TextStyle? textStyle,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: isBordered
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
            : const EdgeInsets.only(left: 20),
        decoration: isBordered
            ? BoxDecoration(
                border: Border.all(
                  color: isChecked ? AppColors.black : AppColors.lightGrey,
                ),
                borderRadius: BorderRadius.circular(8),
              )
            : null,
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: isChecked ? AppColors.black : AppColors.lightGrey,
              size: isBordered ? 16 : 20, // 동의해요는 16, 나머지는 20 (기존 유지)
            ),
            const SizedBox(width: 40),
            Text(
              text,
              style: textStyle ??
                  AppTextStyles.ptdRegular(16).copyWith(
                    color: isChecked ? AppColors.black : AppColors.lightGrey,
                  ),
            ),
            const Spacer(),
            if (showArrow)
              Icon(
                Icons.chevron_right,
                color: isChecked ? AppColors.black : AppColors.lightGrey,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
