import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailNoBuyReceiptCard extends StatelessWidget {
  const DetailNoBuyReceiptCard({super.key});

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
      'assets/images/logos/logo.svg', // 2. 확장자 변경 [cite: 2025-11-27]
      height: 40,
      fit: BoxFit.contain,
    );
  }

  Widget _buildDottedLine() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0; // Dash: 4
        const dashGap = 2.0; // Gap: 2
        const dashHeight = 1.0; // Stroke weight: 1

        // Dash와 Gap을 합친 총 너비(6.0)를 기준으로 개수 계산
        final dashCount = (boxWidth / (dashWidth + dashGap)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return const SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  // DarkScale/Black (1A) 색상 반영
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
      // 1. "안", "산", 그리고 "영수증 묶음" 사이를 균등 분할 배치합니다.
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircleLabel("안"),
        _buildCircleLabel("산"),
        // 2. "영", "수", "증"은 별도의 Row로 묶어 8px 간격을 유지합니다.
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCircleLabel("영"),
            const SizedBox(width: 8), // spacedBy(8.dp) 반영
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
            "[쇼핑몰] 무신사\n[브랜드] 블랙야크\n[의류명]\n여성 아이스제로 레이디 미들 다운자켓#2_LE",
            style: AppTextStyles.ptdMedium(12).copyWith(height: 1.6),
          ),
        ),
        const SizedBox(width: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/products/product_sample.png',
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildSavingSummary() {
    return Column(
      children: [
        _buildSummaryRow("참아낸 금액", "251,100원"),
        _buildSummaryRow("참아낸 할인율", "37%"),
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
    return Column(
      children: [
        Text("**** 신용승인정보 (고객용) ****", style: AppTextStyles.ptdMedium(12)),
        const SizedBox(height: 16),
        _buildInfoRow("고민을 끝낸 날", "2026-02-05"),
        _buildInfoRow("고민한 기간", "13일"),
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
