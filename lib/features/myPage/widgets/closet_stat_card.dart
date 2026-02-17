import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

class ClosetStatCard extends StatelessWidget {
  final String title;
  final int count;
  final String price; // 금액 추가

  const ClosetStatCard({
    super.key,
    required this.title,
    required this.count,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), // 시안에 맞춰 더 둥글게
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15), // 아주 은은한 그림자
            blurRadius: 12,
            offset: const Offset(0, 0.03),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.ptdBold(12).copyWith(height: 1.0)),
          const SizedBox(height: 21),
          Text('$count벌', style: AppTextStyles.ptdExtraBold(32).copyWith(height: 1.0)), // 글자 크기 상향
          const SizedBox(height: 8),
          Text(price, style: AppTextStyles.ptdRegular(12).copyWith(height: 1.0)),
        ],
      ),
    );
  }
}