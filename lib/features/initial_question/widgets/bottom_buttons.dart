import 'package:flutter/material.dart';

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
        onLeftPressed: onAlternative ?? onNext,
        onRightPressed: onNext,
        leftText: '여긴 없어요',
        rightText: '좋아요',
      );
    } else {
      // Q2: '이 정도면 됐어요' 버튼 숨김 (선택지 UI로 변경됨에 따라)
      return const SizedBox.shrink();
    }
  }
}
