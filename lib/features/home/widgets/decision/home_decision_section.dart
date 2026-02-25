import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/utils/format_utils.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/models/dashboard_model.dart';
import 'package:ttobaba/features/home/providers/home_lists_provider.dart';
import 'package:ttobaba/features/home/widgets/decision/yet_decided_item.dart';
import 'package:ttobaba/features/home/screens/home_decision_list_screen.dart';

class HomeDecisionSection extends ConsumerWidget {
  const HomeDecisionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consideringAsync = ref.watch(consideringListProvider);

    return SingleChildScrollView(
      child: consideringAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Text("아직 고민 중인 상품이 없습니다."),
              ),
            );
          }

          // 하이라이트 계산
          ConsideringListItem? longest;
          ConsideringListItem? mostExpensive;

          for (final item in items) {
            final duration = item.durationDays ?? 0;
            if (longest == null || duration > (longest.durationDays ?? 0)) {
              longest = item;
            }
            if (mostExpensive == null || item.price > mostExpensive.price) {
              mostExpensive = item;
            }
          }

          return Column(
            children: [
              _buildHighlightHeader(context, longest, mostExpensive),
              const SizedBox(height: 4),
              _buildListSection(context, items),
            ],
          );
        },
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: CircularProgressIndicator(),
          ),
        ),
        error: (e, __) => Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text("오류가 발생했습니다: $e"),
          ),
        ),
      ),
    );
  }

  Widget _buildHighlightHeader(BuildContext context,
      ConsideringListItem? longest, ConsideringListItem? mostExpensive) {
    return Container(
      width: double.infinity,
      color: AppColors.primaryMain,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: _buildHighlightCard(context, longest, mostExpensive),
    );
  }

  Widget _buildHighlightCard(BuildContext context, ConsideringListItem? longest,
      ConsideringListItem? mostExpensive) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withValues(alpha: 0.15), blurRadius: 12),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (longest != null)
            _buildHighlightItem(
              context,
              "가장 오래 고민 중인 옷 🤔",
              formatConsideringDays(longest.durationDays),
              longest,
            ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(height: 1, color: AppColors.paleGrey),
          ),
          if (mostExpensive != null)
            _buildHighlightItem(
              context,
              "고민 중인 가장 비싼 옷 💰",
              formatPriceWithUnit(mostExpensive.price),
              mostExpensive,
            ),
        ],
      ),
    );
  }

  Widget _buildHighlightItem(BuildContext context, String title, String value,
      ConsideringListItem item) {
    return GestureDetector(
      onTap: () => context.push('/chat/${item.userProductId}'),
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  AppTextStyles.ptdBold(16).copyWith(color: AppColors.black)),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: (item.productImg != null &&
                          item.productImg!.startsWith('http'))
                      ? Image.network(
                          item.productImg!,
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildPlaceholder(),
                        )
                      : Image.asset(
                          item.productImg ??
                              'assets/images/products/product_sample.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildPlaceholder(),
                        ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(value,
                          style: AppTextStyles.ptdBold(16)
                              .copyWith(color: AppColors.black)),
                      Text(
                        item.productName,
                        style: AppTextStyles.ptdRegular(12)
                            .copyWith(color: AppColors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                _buildSmallDecisionButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 32,
      height: 32,
      color: AppColors.lightGrey,
      child: const Icon(Icons.image_not_supported,
          size: 16, color: AppColors.grey),
    );
  }

  Widget _buildSmallDecisionButton() {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryMain,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "결정했어!",
        textAlign: TextAlign.center,
        style: AppTextStyles.ptdBold(12).copyWith(
          color: AppColors.white,
          height: 1.0,
        ),
      ),
    );
  }

  Widget _buildListSection(
      BuildContext context, List<ConsideringListItem> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildListHeader(context),
          const SizedBox(height: 28),
          ...items.map((item) => YetDecidedItem(
                imageUrl: item.productImg ??
                    'assets/images/products/product_sample.png',
                title: item.productName,
                price: formatPriceWithUnit(item.price, zeroLabel: '0원'),
                dateTag: formatConsideringDays(item.durationDays),
                onTap: () => context.push('/chat/${item.userProductId}'),
              )),
        ],
      ),
    );
  }

  Widget _buildListHeader(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DecisionListScreen(),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "전체 리스트",
            style: AppTextStyles.ptdBold(20).copyWith(color: AppColors.black),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
