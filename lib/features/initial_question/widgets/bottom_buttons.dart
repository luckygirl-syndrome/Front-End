import 'package:flutter/material.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/two_buttons.dart';

/// 하단 액션 버튼 그룹 위젯
class BottomButtons extends StatelessWidget {
  final String type;
  final bool isLastPage; // 마지막 페이지 여부
  final VoidCallback onNext;
  final VoidCallback? onAlternative; // '여긴 없어요' 등을 위한 콜백

  const BottomButtons({
    super.key,
    required this.type,
    required this.isLastPage,
    required this.onNext,
    this.onAlternative,
  });

  @override
  Widget build(BuildContext context) {
    // 마지막 페이지(Q4)이면 '최종분석하기' 버튼만 표시
    if (isLastPage) {
      return SizedBox(
        width: double.infinity,
        child: AppButton(
          text: '최종분석하기',
          onPressed: onNext,
        ),
      );
    }

    if (type == 'choice') {
      // Q1: 버튼 2개 (여긴 없어요 / 좋아요)
      return TwoButtons(
        onLeftPressed: onAlternative ?? onNext,
        onRightPressed: onNext,
        leftText: '여긴 없어요',
        rightText: '좋아요',
      );
    } else {
      // Q2, Q3 등: 버튼 표시 안함
      return const SizedBox.shrink();
    }
  }
}
