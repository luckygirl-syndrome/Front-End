import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

import '../../../core/widgets/two_buttons.dart';

/// 하단 액션 버튼 그룹 위젯
class BottomButtons extends StatelessWidget {
  final String type;
  final VoidCallback onNext;
  final VoidCallback? onAlternative; // '여긴 없어요' 등을 위한 콜백

  const BottomButtons({
    super.key,
    required this.type,
    required this.onNext,
    this.onAlternative,
  });

  @override
  Widget build(BuildContext context) {
    if (type == 'choice') {
      // Q1: 버튼 2개 (여긴 없어요 / 좋아요)
      return TwoButtons(
        onDislike: onAlternative ?? onNext,
        onLike: onNext,
        dislikeText: '여긴 없어요',
        likeText: '좋아요',
      );
    } else {
      // Q2: 버튼 1개 (이 정도면 됐어요)
      return SizedBox(
        width: double.infinity,
        child: AppButton(
          text: '이 정도면 됐어요',
          onPressed: onNext,
        ),
      );
    }
  }
}