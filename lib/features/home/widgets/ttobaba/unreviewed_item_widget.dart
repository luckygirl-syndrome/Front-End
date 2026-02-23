import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/widgets/app_button.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

class UnreviewedItemWidget extends StatelessWidget {
  const UnreviewedItemWidget({super.key});

  // lib/features/home/widgets/ttobaba/unreviewed_item_widget.dart

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이 옷, 산 지 2주일이 넘었네요.\n만족하세요?",
          style: AppTextStyles.ptdBold(20)
              .copyWith(color: AppColors.black, height: 1.2),
        ),
        const SizedBox(height: 16),
        Container(
          height: 132,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.15),
                blurRadius: 12,
              ),
            ],
          ),
          // 👈 이미지가 카드 높이에 꽉 차도록 Container 패딩은 EdgeInsets.zero로 설정합니다. [cite: 2026-02-17]
          child: Row(
            children: [
              // [왼쪽] 상품 이미지: 카드 높이와 동일한 100x100 [cite: 2026-02-17]
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/products/product_sample.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),

              // [오른쪽] 상품 정보 영역
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    // 👈 2. 피그마의 Auto 설정을 위해 내부 요소들을 상하 끝으로 벌립니다.
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // [상단] 브랜드명 + 닫기 버튼
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "지그재그",
                            style: AppTextStyles.ptdBold(12)
                                .copyWith(color: AppColors.black),
                          ),
                          const Icon(Icons.close,
                              size: 16, color: AppColors.black),
                        ],
                      ),

                      // [중앙] 상품명 및 가격 (뭉쳐서 배치)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "[씬라이트] 여성 후드 재킷_SPJPG11G31",
                            style: AppTextStyles.ptdMedium(12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "29,950원",
                            style: AppTextStyles.ptdBold(16),
                          ),
                        ],
                      ),

                      // [하단] 날짜 + 평가하기 버튼
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "구매한 지 18일 지남",
                            style: AppTextStyles.ptdRegular(12)
                                .copyWith(color: AppColors.black),
                          ),

                          // 👈 1. 기존 Container를 AppButton으로 교체합니다. [cite: 2026-02-17]
                          AppButton(
                            text: "평가하기",
                            // 👈 2. 작은 버튼 형태를 위해 width를 64px로 고정합니다. [cite: 2026-02-13]
                            width: 60,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            borderRadius: 4,
                            textStyle: AppTextStyles.ptdMedium(12),
                            onPressed: () {
                              // 👈 4. 버튼 클릭 시 다음 화면으로 이동합니다. [cite: 2026-02-17]
                              context.push('/feedback');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
