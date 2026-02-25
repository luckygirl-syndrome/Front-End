import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/providers/home_lists_provider.dart';
import 'package:ttobaba/features/home/widgets/decision/yet_decided_item.dart';

class DecisionListScreen extends ConsumerWidget {
  const DecisionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consideringAsync = ref.watch(consideringListProvider);
    final formatter = NumberFormat.decimalPattern();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👈 1. 뒤로가기 버튼 전용 Row
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // 👈 3. 타이틀과 필터 아이콘 Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "전체 리스트",
                    style: AppTextStyles.ptdBold(
                      28,
                    ).copyWith(color: AppColors.black),
                  ),
                  const Icon(Icons.tune, color: AppColors.black),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // 4. 리스트 영역
            Expanded(
              child: consideringAsync.when(
                data: (items) {
                  if (items.isEmpty) {
                    return const Center(
                      child: Text("아직 고민 중인 상품이 없습니다."),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return YetDecidedItem(
                        imageUrl: item.productImg ??
                            'assets/images/products/product_sample.png',
                        title: item.productName,
                        price: "${formatter.format(item.price)}원",
                        dateTag: '${item.durationDays ?? 0}일 고민',
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, _) => Center(
                  child: Text("오류가 발생했습니다: $error"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
