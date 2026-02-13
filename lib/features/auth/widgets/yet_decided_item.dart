
import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

class YetDecidedItem extends StatelessWidget {
  const YetDecidedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // 1. Modifier.width(326.dp).height(120.dp)
      width: double.infinity,
      height: 120,
      // 2. Modifier.shadow 및 background(shape = RoundedCornerShape(12.dp))
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x261C1C1C),
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
              'assets/images/product_sample.png',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
                  style: AppTextStyles.ptdMedium(14).copyWith(height: 1.2),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '199,900원',
                      style: AppTextStyles.ptdBold(18),
                    ),
                    Text(
                      '13일 고민',
                      style: AppTextStyles.ptdRegular(12).copyWith(color: Colors.grey),
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