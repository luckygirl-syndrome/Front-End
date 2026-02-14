import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import '../../../core/widgets/app_button.dart';

class SbtiActionButtons extends StatelessWidget {
  final VoidCallback onDislike;
  final VoidCallback onLike;

  const SbtiActionButtons({
    super.key,
    required this.onDislike,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            text: '싫어요',
            onPressed: onDislike,
            backgroundColor: AppColors.secondaryMain, // 파란색 톤
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AppButton(
            text: '좋아요',
            onPressed: onLike,
            backgroundColor: AppColors.primaryMain, // 노란색 톤
          ),
        ),
      ],
    );
  }
}