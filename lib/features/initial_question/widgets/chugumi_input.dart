import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

import '../../../core/widgets/two_buttons.dart';

/// Q2. 추구미 입력창 위젯
class ChugumiInput extends StatelessWidget {
  final String? initialValue;
  final Function(String) onChanged;

  const ChugumiInput({
    super.key, 
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 356,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: TextField(
        maxLines: null,
        expands: true, // 박스 전체를 차지하도록 설정
        textAlignVertical: TextAlignVertical.top,
        style: AppTextStyles.ptdRegular(16).copyWith(color: AppColors.black),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: '추구미를 입력해 주세요',
          hintStyle: AppTextStyles.ptdRegular(16).copyWith(color: AppColors.lightGrey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}