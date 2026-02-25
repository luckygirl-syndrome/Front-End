import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/providers/home_lists_provider.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/detail_nobuy_receipt.dart';

class DetailNoBuyReceiptScreen extends ConsumerWidget {
  final int userProductId;

  const DetailNoBuyReceiptScreen({
    super.key,
    required this.userProductId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receiptAsync = ref.watch(receiptDetailProvider(userProductId));

    return Scaffold(
      backgroundColor: AppColors.primaryMain,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 32 + 24,
        leading: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                color: AppColors.white, size: 24),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ),
      body: receiptAsync.when(
        data: (receipt) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: DetailNoBuyReceiptCard(receipt: receipt),
                ),
              ),
            ),
            _buildBottomActionBar(),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.white),
        ),
        error: (e, __) => Center(
          child: Text(
            "오류가 발생했습니다: $e",
            style: const TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActionBar() {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
        child: Row(
          children: [
            Expanded(child: _buildActionButton(Icons.save_alt, "저장하기")),
            const SizedBox(width: 12),
            Expanded(child: _buildActionButton(Icons.share, "공유하기")),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColors.black),
          const SizedBox(width: 8),
          Text(label,
              style:
                  AppTextStyles.ptdBold(20).copyWith(color: AppColors.black)),
        ],
      ),
    );
  }
}
