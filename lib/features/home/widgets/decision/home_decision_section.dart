import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/features/home/widgets/decision/yet_decided_item.dart';
import 'package:ttobaba/features/home/screens/home_decision_list_screen.dart';

class HomeDecisionSection extends StatelessWidget {
  const HomeDecisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 👈 1. 상단 노란색 영역 (변수명 및 높이 교정) [cite: 2026-02-13]
          _buildHighlightHeader(),
          
          const SizedBox(height: 4),
          
          _buildListSection(context),
        ],
      ),
    );
  }

  // 👈 [교정] height: 254를 제거하여 오버플로우 에러를 전산학적으로 해결 [cite: 2026-01-02]
  Widget _buildHighlightHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.primaryMain,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: _buildHighlightCard(),
    );
  }

  Widget _buildHighlightCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x261c1c1c), 
            blurRadius: 12
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHighlightItem(
            "가장 오래 고민 중인 옷 🤔", 
            "37일", 
            "[프리미엄/인생핏!/면100] 답답asdfasdfasdfasdfasdfasdfasfd함 없는...",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(height: 1, color: AppColors.paleGrey),
          ),
          _buildHighlightItem(
            "고민 중인 가장 비싼 옷 💰", 
            "199,900원", 
            "리나 라운드 긴팔 가을 겨울 티asdfasdfasdfasdfasdfasdfasdfasdfas셔츠 세...",
          ),
        ],
      ),
    );
  }

  // 👈 3. [교정] 변수명에 description을 추가하여 데이터 무결성 확보 [cite: 2026-01-02]
  Widget _buildHighlightItem(String title, String value, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.ptdBold(16).copyWith(color: AppColors.black)),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'assets/images/product_sample.png',
                  width: 32, height: 32, fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 20),
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Hug 효과를 위해 최소 크기 설정 [cite: 2026-02-13]
                  children: [
                    Text(
                      value, 
                      style: AppTextStyles.ptdBold(16).copyWith(color: AppColors.black)
                    ),
                    Text(
                      desc,
                      style: AppTextStyles.ptdRegular(12).copyWith(color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 20),

              _buildSmallDecisionButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallDecisionButton() {
    return Container(
      height: 32, // 고정 높이 [cite: 2026-02-13]
      padding: const EdgeInsets.symmetric(horizontal: 12),
      // 👈 1. 컨테이너 내부 자식을 정중앙에 배치합니다. [cite: 2026-01-02]
      alignment: Alignment.center, 
      decoration: BoxDecoration(
        color: AppColors.primaryMain,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "결정했어!",
        // 👈 2. 텍스트 자체의 정렬도 중앙으로 맞추어 무결성을 확보합니다. [cite: 2026-01-02]
        textAlign: TextAlign.center,
        style: AppTextStyles.ptdBold(12).copyWith(
          color: AppColors.white,
          height: 1.0, // 👈 3. 폰트 자체의 행간을 제거하여 수직 정렬 오차를 방지합니다. [cite: 2026-02-13]
        ),
      ),
    );
  }

  Widget _buildListSection(BuildContext context) {
    return Container(
      // 👈 1. width는 infinity, height는 미지정(Hug)하여 유연성 확보 [cite: 2026-01-02, 2026-02-13]
      width: double.infinity,
      // 👈 2. Modifier.padding(all = 32.dp) 반영
      padding: const EdgeInsets.all(32),
      child: Column(
        // 👈 3. horizontalAlignment = Alignment.CenterHorizontally 반영 [cite: 2026-02-13]
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 상단 타이틀 행 ("전체 리스트" + ">")
          _buildListHeader(context),
          
          // 👈 4. verticalArrangement = Arrangement.spacedBy(28.dp) 반영
          const SizedBox(height: 28),
          
          // 리스트 아이템들 (임시 반복 호출) [cite: 2026-02-13]
          const YetDecidedItem(
            imageUrl: 'assets/images/product_sample.png',
            title: '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
            price: '199,900원',
            dateTag: '13일 고민',
          ),
          const SizedBox(height: 12),
          const YetDecidedItem(
            imageUrl: 'assets/images/product_sample.png',
            title: '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
            price: '199,900원',
            dateTag: '13일 고민',
          ),
          const SizedBox(height: 12),
          const YetDecidedItem(
            imageUrl: 'assets/images/product_sample.png',
            title: '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
            price: '199,900원',
            dateTag: '13일 고민',
          ),
          const SizedBox(height: 12),
          const YetDecidedItem(
            imageUrl: 'assets/images/product_sample.png',
            title: '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
            price: '199,900원',
            dateTag: '13일 고민',
          ),
          const SizedBox(height: 12),
          const YetDecidedItem(
            imageUrl: 'assets/images/product_sample.png',
            title: '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
            price: '199,900원',
            dateTag: '13일 고민',
          ),
          const SizedBox(height: 12),
          const YetDecidedItem(
            imageUrl: 'assets/images/product_sample.png',
            title: '[프리미엄/인생핏!/면100] 답답함 없는, 리나 라운드 긴팔 가을 겨울 티셔츠 세...',
            price: '199,900원',
            dateTag: '13일 고민',
          ),
        ],
      ),
    );
  }

  Widget _buildListHeader(BuildContext context) {
    return GestureDetector(
      // 👈 클릭 시 새로운 화면으로 이동 (Navigator 사용) [cite: 2026-01-02]
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          // 👈 임포트가 성공하면 에러가 해결됩니다. 여전히 에러 시 const 제거 조치 [cite: 2026-01-02]
            builder: (context) => const DecisionListScreen(),
          ),
        );
      },
      // 클릭 영역을 행 전체로 확장하여 사용자 경험(UX) 무결성 확보 [cite: 2026-02-13]
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