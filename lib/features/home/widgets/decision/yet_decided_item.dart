
import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

class YetDecidedItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String dateTag;
  
  const YetDecidedItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.dateTag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 1. Modifier.width(326.dp).height(120.dp)
      width: double.infinity,
      // 2. Modifier.shadow 및 background(shape = RoundedCornerShape(12.dp))
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 12, // elevation 12.dp에 대응하는 전산학적 수치
          ),
        ],
      ),
      // 3. Modifier.padding(all = 20.dp)
      padding: const EdgeInsets.all(20),
      child: Row(
        // 4. horizontalArrangement = Arrangement.spacedBy(20.dp)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 왼쪽: 상품 이미지 (Modifier.size(80.dp) - 패딩 제외 남은 높이)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          
          const SizedBox(width: 20), // spacedBy(20.dp)
          
          // 오른쪽: 텍스트 영역
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // 👈 세로 방향 Hug 구현 [cite: 2026-01-02]
              children: [
                // 👈 4. 주입받은 title 사용 [cite: 2026-02-13]
                Text(
                  title,
                  style: AppTextStyles.ptdMedium(14).copyWith(
                    color: AppColors.black,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12), // 텍스트 간격 확보 [cite: 2026-02-13]
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 👈 5. 주입받은 price 사용 [cite: 2026-02-13]
                    Text(
                      price,
                      style: AppTextStyles.ptdBold(18).copyWith(color: AppColors.black),
                    ),
                    // 👈 6. 주입받은 dateTag 사용 [cite: 2026-02-13]
                    Text(
                      dateTag,
                      style: AppTextStyles.ptdRegular(12).copyWith(color: AppColors.lightGrey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}