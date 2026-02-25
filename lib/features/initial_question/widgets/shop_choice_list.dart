import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

/// Q1. 쇼핑몰 복수 선택 리스트 위젯
class ShopChoiceList extends StatelessWidget {
  final List<String> options;
  final Set<String> selectedMalls;
  final Function(String) onToggle;

  const ShopChoiceList({
    super.key,
    required this.options,
    required this.selectedMalls,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        final isSelected = selectedMalls.contains(option);
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: AppButton(
            text: option,
            textColor: isSelected ? AppColors.white : AppColors.primaryMain,
            backgroundColor:
                isSelected ? AppColors.primaryMain : AppColors.white,
            borderColor: AppColors.primaryMain,
            borderRadius: 12,
            borderWidth: 1,
            onPressed: () => onToggle(option),
          ),
        );
      }).toList(),
    );
  }
}
