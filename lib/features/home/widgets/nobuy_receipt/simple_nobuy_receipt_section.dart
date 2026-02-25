import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/utils/format_utils.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/models/dashboard_model.dart';
import 'package:ttobaba/features/home/providers/home_lists_provider.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/simple_nobuy_receipt.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/detail_nobuy_receipt_screen.dart';

class SimpleNobuyReceiptSection extends ConsumerWidget {
  const SimpleNobuyReceiptSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptsAsync = ref.watch(unboughtReceiptsListProvider);

    return Container(
      width: double.infinity,
      color: AppColors.black,
      child: receiptsAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Text(
                  "아직 발행된 영수증이 없습니다.",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 12),
                _buildOverlappingList(context, items),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: CircularProgressIndicator(color: AppColors.white),
          ),
        ),
        error: (e, __) => Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              "오류가 발생했습니다: $e",
              style: const TextStyle(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "전체 리스트",
            style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.white),
          ),
          const Icon(Icons.tune, color: AppColors.white),
        ],
      ),
    );
  }

  Widget _buildOverlappingList(
      BuildContext context, List<ReceiptListItem> items) {
    final List<Color> colors = [
      AppColors.secondaryMain,
      AppColors.primaryMain,
      AppColors.white,
    ];

    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        final isLeft = index % 2 == 0;
        final color = colors[index % colors.length];

        return Transform.translate(
          offset: Offset(0, index == 0 ? 0 : -140.0 * index),
          child: Align(
            alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: isLeft ? 32 : 0,
                right: isLeft ? 0 : 32,
              ),
              child: SimpleNoBuyReceipt(
                backgroundColor: color,
                shadowColor: color,
                title: item.productName,
                price: formatPriceWithUnit(item.price, zeroLabel: '0원'),
                discount: "${(item.discountRate ?? 0).toInt()}%",
                imageUrl: "assets/images/products/product_sample.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailNoBuyReceiptScreen(
                        userProductId: item.userProductId,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
