import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

class SimpleNoBuyReceipt extends StatelessWidget {
  final String title;
  final String price;
  final String discount;
  final String imageUrl;
  final Color backgroundColor;
  final Color shadowColor;
  final VoidCallback? onTap;

  Color get contentColor =>
      backgroundColor == AppColors.white ? AppColors.black : AppColors.white;

  const SimpleNoBuyReceipt({
    super.key,
    this.title = "여성 아이스제로 레이디 미들 다운자켓#2_LE", // 제품 이름 [cite: 2026-01-02]
    this.price = "251,100원", // 가격 [cite: 2026-01-02]
    this.discount = "37%", // 할인율 [cite: 2026-01-02]
    this.imageUrl =
        "assets/images/products/product_sample.png", // 사진 경로 [cite: 2026-01-02]
    this.backgroundColor = AppColors.primaryMain,
    this.shadowColor = AppColors.primaryMain,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double cardWidth = screenWidth * (240 / 390);

    return GestureDetector(
      onTap: onTap, // 외부에서 주입받은 클릭 이벤트 실행 [cite: 2026-02-13]
      child: Container(
        width: cardWidth,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 16,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(contentColor),
            const SizedBox(height: 20),
            _buildTitle(title, contentColor),
            const SizedBox(height: 12),
            _buildPriceTags(price, discount),
            const SizedBox(height: 12),
            _buildProductImage(imageUrl, cardWidth),
          ],
        ),
      ),
    );
  }

  // "자세히 보기 >" 영역
  Widget _buildHeader(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "자세히 보기",
          style: AppTextStyles.ptdMedium(12).copyWith(color: color),
        ),
        Icon(Icons.chevron_right, size: 16, color: color),
      ],
    );
  }

  Widget _buildTitle(String titleText, Color color) {
    return Text(
      titleText,
      style: AppTextStyles.ptdExtraBold(20).copyWith(color: color, height: 1.2),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPriceTags(String priceText, String discountText) {
    return Row(
      children: [
        _buildTag(priceText),
        const SizedBox(width: 8),
        _buildTag(discountText),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTextStyles.ptdBold(12).copyWith(color: AppColors.white),
      ),
    );
  }

  Widget _buildProductImage(String url, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        url,
        width: double.infinity,
        height: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
