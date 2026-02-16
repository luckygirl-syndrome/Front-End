import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/detail_nobuy_receipt.dart';

class DetailNoBuyReceiptScreen extends StatelessWidget {
  const DetailNoBuyReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryMain,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 32 + 24, // 패딩(32) + 아이콘크기(약 24)
        leading: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 24),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ),
      ), // AppBar와 본문 사이의 간격을 16으로 설정 [cite: 2026-01-02]
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              // 1. 위쪽 패딩을 0으로 설정하여 상단에 밀착시킵니다. [cite: 2026-02-15]
              padding: EdgeInsets.only(left: 32, right: 32, top: 16),
              child: Align(
                alignment: Alignment.topCenter,
                child: DetailNoBuyReceiptCard(), 
              ),
            ),
          ),
          _buildBottomActionBar(),
        ],
      ),
    );
  }

  // Modifier 명세: width 390, height 74, padding(32, 0, 32, 20) 반영 [cite: 2026-02-15]
  Widget _buildBottomActionBar() {
    return SafeArea(
      top: false, // 위쪽은 제외하고 하단만 안전 영역 확보
      child: Container(
        width: double.infinity,
        // height를 제거하여 내부 콘텐츠 높이에 맞춤 (Hug) [cite: 2026-02-15]
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
          Text(
            label, 
            style: AppTextStyles.ptdBold(20).copyWith(color: AppColors.black)
          ),
        ],
      ),
    );
  }
}