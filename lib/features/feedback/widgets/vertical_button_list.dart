import 'package:flutter/material.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

class FeedbackButtonData {
  final String text;
  final Color color;
  final VoidCallback onTap;

  FeedbackButtonData({
    required this.text,
    required this.color,
    required this.onTap,
  });
}

class VerticalButtonList extends StatelessWidget {
  final List<FeedbackButtonData> items;
  final double spacing;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;
  final double? borderWidth;

  const VerticalButtonList({
    super.key,
    required this.items,
    this.spacing = 20.0, // 버튼 사이 간격 [cite: 2026-02-17]
    this.borderRadius = 12.0,
    this.boxShadow,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => Padding(
        padding: EdgeInsets.only(
          bottom: item == items.last ? 0 : spacing,
        ),
        child: AppButton(
          text: item.text,
          backgroundColor: item.color,
          onPressed: item.onTap,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          borderColor: borderColor,
          borderWidth: borderWidth,
        ),
      )).toList(),
    );
  }
}