import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'app_button.dart';

class TwoButtons extends StatelessWidget {
  final VoidCallback onDislike;
  final VoidCallback onLike;
  final String dislikeText; // 왼쪽 버튼 텍스트 추가
  final String likeText;    // 오른쪽 버튼 텍스트 추가

  const TwoButtons({
    super.key,
    required this.onDislike,
    required this.onLike,
    this.dislikeText = '싫어요', // 기본값 설정
    this.likeText = '좋아요',        // 기본값 설정
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            text: dislikeText,
            onPressed: onDislike,
            backgroundColor: AppColors.secondaryMain, // 파란색 톤
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AppButton(
            text: likeText,
            onPressed: onLike,
            backgroundColor: AppColors.primaryMain, // 노란색 톤
          ),
        ),
      ],
    );
  }
}