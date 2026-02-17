// lib/core/widgets/app_longtext_field.dart

import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';

class AppLongtextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final double? height;
  final ValueChanged<String>? onChanged;

  const AppLongtextField({
    super.key,
    this.hintText = "이유를 입력해 주세요",
    this.controller,
    this.height,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightGrey, width: 1), // 👈 선 두께 1 반영
      ),
      child: Padding(
        padding: const EdgeInsets.all(20), // 👈 가이드 수치 20 반영
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          // 👈 핑거 이모지: 틀 안에서 가득 채우고 스크롤 가능하게 설정 [cite: 2026-02-17]
          maxLines: null, 
          expands: true, 
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.lightGrey, fontSize: 16),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}