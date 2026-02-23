import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/widgets/decision/yet_decided_item.dart';

class DecisionListScreen extends StatelessWidget {
  // 👈 const 생성자를 추가하여 'Not a constant expression' 에러를 해결 [cite: 2026-01-02]
  const DecisionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👈 1. 뒤로가기 버튼 전용 Row (Row 1)
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios,
                        color: AppColors.black),
                  ),
                ],
              ),
            ),

            // 👈 2. 뒤로가기 버튼과 타이틀 사이 28px 수직 간격
            const SizedBox(height: 28),

            // 👈 3. 타이틀과 필터 아이콘 Row (Row 2)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "전체 리스트",
                    style: AppTextStyles.ptdBold(28)
                        .copyWith(color: AppColors.black),
                  ),
                  const Icon(Icons.tune, color: AppColors.black),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // 4. 리스트 영역
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                itemCount: 10,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return const YetDecidedItem(
                    imageUrl: 'assets/images/products/product_sample.png',
                    title: '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
                    price: '199,900원',
                    dateTag: '13일 고민',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
