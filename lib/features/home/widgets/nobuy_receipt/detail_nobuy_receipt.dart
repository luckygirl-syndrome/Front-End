import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ttobaba/features/home/models/dashboard_model.dart';

class DetailNoBuyReceiptCard extends StatelessWidget {
  final ReceiptDetail receipt;

  const DetailNoBuyReceiptCard({
    super.key,
    required this.receipt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.2),
            blurRadius: 16,
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 20, top: 32, right: 20, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 섹션 1: 상단 로고
          _buildLogo(),

          const SizedBox(height: 16),
          _buildDottedLine(),
          const SizedBox(height: 16),

          // 섹션 2: "안 산 영 수 증" 타이틀
          _buildReceiptLabels(),

          const SizedBox(height: 16),

          // 섹션 3: 상품 정보 및 이미지
          _buildProductSection(),

          const SizedBox(height: 16),
          _buildDottedLine(),
          const SizedBox(height: 16),

          // 섹션 4: 참아낸 금액 요약
          _buildSavingSummary(),
          const SizedBox(height: 16),

          // 섹션 5: 승인 정보
          _buildApprovalInfo(),

          const SizedBox(height: 16),
          _buildDottedLine(),
          const SizedBox(height: 16),

          // 섹션 6: 바코드 및 푸터
          _buildFooterSection(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return SvgPicture.asset(
      'assets/images/logos/logo.svg',
      height: 40,
      fit: BoxFit.contain,
    );
  }

  Widget _buildDottedLine() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashGap = 2.0;
        const dashHeight = 1.0;

        final dashCount = (boxWidth / (dashWidth + dashGap)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.black,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildReceiptLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircleLabel("안"),
        _buildCircleLabel("산"),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCircleLabel("영"),
            const SizedBox(width: 8),
            _buildCircleLabel("수"),
            const SizedBox(width: 8),
            _buildCircleLabel("증"),
          ],
        ),
      ],
    );
  }

  Widget _buildCircleLabel(String char) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.primaryMain,
        shape: BoxShape.circle,
      ),
      child: Text(char,
          style: AppTextStyles.ptdBold(16).copyWith(color: AppColors.black)),
    );
  }

  Widget _buildProductSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "[쇼핑몰] ${receipt.mallName ?? '-'}\n[브랜드] ${receipt.brand ?? '-'}\n[의류명]\n${receipt.productName}",
            style: AppTextStyles.ptdMedium(12).copyWith(height: 1.6),
          ),
        ),
        const SizedBox(width: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: (receipt.productImg != null &&
                  receipt.productImg!.startsWith('http'))
              ? Image.network(
                  receipt.productImg!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildPlaceholder(),
                )
              : Image.asset(
                  receipt.productImg ??
                      'assets/images/products/product_sample.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildPlaceholder(),
                ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 80,
      height: 80,
      color: AppColors.lightGrey,
      child: const Icon(Icons.image_not_supported,
          size: 24, color: AppColors.grey),
    );
  }

  Widget _buildSavingSummary() {
    final formatter = NumberFormat.decimalPattern();
    final discount = (receipt.discountRate ?? 0).toInt();

    return Column(
      children: [
        _buildSummaryRow(
            "참아낸 금액", "${formatter.format(receipt.savedAmount ?? 0)}원"),
        _buildSummaryRow("참아낸 할인율", "$discount%"),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.ptdMedium(24)),
        Text(value, style: AppTextStyles.ptdExtraBold(24)),
      ],
    );
  }

  Widget _buildApprovalInfo() {
    String dateStr = '-';
    if (receipt.completedAt != null) {
      try {
        final date = DateTime.parse(receipt.completedAt!);
        dateStr = DateFormat('yyyy-MM-dd').format(date);
      } catch (_) {}
    }

    return Column(
      children: [
        Text("**** 신용승인정보 (고객용) ****", style: AppTextStyles.ptdMedium(12)),
        const SizedBox(height: 16),
        _buildInfoRow("고민을 끝낸 날", dateStr),
        _buildInfoRow("고민한 기간", "${receipt.durationDays ?? 0}일"),
        _buildInfoRow("승인/가맹점", "럭키걸신드롬"),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.ptdMedium(12)),
          Text(value, style: AppTextStyles.ptdBold(12)),
        ],
      ),
    );
  }

  Widget _buildFooterSection() {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/logos/barcode.svg',
          height: 28,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text("** 감사합니다 **", style: AppTextStyles.ptdMedium(12)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "또 사기 전에 또바바",
              style: AppTextStyles.ptdBold(12).copyWith(color: AppColors.grey),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(
              'assets/images/logos/grey_logo.svg',
              height: 24,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ],
    );
  }
}
