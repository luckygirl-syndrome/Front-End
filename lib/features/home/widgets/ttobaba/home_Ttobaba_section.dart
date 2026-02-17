import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_button.dart';
import 'package:ttobaba/core/widgets/link_input_popup.dart';
import 'package:ttobaba/features/home/widgets/ttobaba/unreviewed_item_widget.dart';

class HomeTtobabaSection extends StatelessWidget {
  final bool showReviewWidget; 

  const HomeTtobabaSection({
    super.key, 
    this.showReviewWidget = false, // 기본값 false
  });

  @override
  Widget build(BuildContext context){
    // 👈 1. SingleChildScrollView를 최상위로 올려 배경 원까지 포함해 스크롤되게 합니다. [cite: 2026-02-17]
    return SingleChildScrollView(
      // 👈 2. 배경 원이 화면 가로 너비보다 넓으므로 잘리지 않게 clipBehavior를 설정합니다. [cite: 2026-01-02]
      clipBehavior: Clip.hardEdge, 
      child: Stack(
        // 👈 3. Stack의 크기는 내부의 non-positioned 자식(Padding/Column)에 의해 결정됩니다. [cite: 2026-02-17]
        clipBehavior: Clip.none, 
        children: [
          // 👈 4. 배경을 Stack의 첫 번째 자식으로 두어 콘텐츠 아래에 깔리고 함께 이동하게 합니다. [cite: 2026-02-17]
          _buildYellowBackground(context),

          // 실제 콘텐츠 레이어
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showReviewWidget) ...[
                // 👈 1. 위젯 부분에만 좌우 패딩 32px 적용 [cite: 2026-02-17]
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
                  child: const UnreviewedItemWidget(),
                ),
                const SizedBox(height: 32), 

                // 👈 2. 가로선은 패딩 없이 배치하여 화면 끝까지 닿게 합니다.
                Container(
                  height: 2,
                  width: double.infinity,
                  color: AppColors.paleGrey,
                ),
                
                const SizedBox(height: 32),
              ],

              // 👈 3. 나머지 상단 콘텐츠들도 각각 32px 패딩 적용 [cite: 2026-02-17]
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    _buildTitle(),
                    const SizedBox(height: 32),
                    _buildCharacterImage(),
                    const SizedBox(height: 32),
                    _buildActionButton(context),
                  ],
                ),
              ),
              
              const SizedBox(height: 60), 

              // 👈 4. 하단 그룹도 각각 32px 패딩 적용 및 하단 여백 40px 추가 [cite: 2026-02-17]
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 40),
                child: Column(
                  children: [
                    _buildSavingCard(),
                    const SizedBox(height: 12),
                    _buildChatNumCard(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // 1. 타이틀: extrabold/24, 검은색 [cite: 2026-02-13]
  Widget _buildTitle() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        "경현 님, 오늘은\n어떤 옷으로 고민 중인가요?",
        textAlign: TextAlign.left, // 시안에 따라 왼쪽 정렬 [cite: 2026-02-13]
        style: AppTextStyles.ptdExtraBold(24).copyWith(
          color: AppColors.black,
          height: 1.4, // 가독성을 위한 행간 조절 [cite: 2026-01-02]
        ),
      ),
    );
  }

  // 2. 캐릭터: 가로/세로 최대 120 [cite: 2026-02-13]
  Widget _buildCharacterImage() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 120,
        maxHeight: 120,
      ),
      child: Image.asset(
        'assets/images/profile_image_sample.png',
        fit: BoxFit.contain,
      ),
    );
  }

  // 3. 버튼: core의 AppButton 활용 [cite: 2026-02-13]
  Widget _buildActionButton(BuildContext context) {
    return AppButton(
      padding: const EdgeInsets.all(32),
      text: "또바야, 나 이 옷 사고 싶어",
      // 👈 onTap 대신 onPressed를 사용해야 합니다.
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true, // 배경 클릭 시 닫기 허용 [cite: 2026-01-02]
          builder: (context) => const LinkInputPopup(),
        );
      },
      backgroundColor: AppColors.primaryMain, // 시안의 노란색 적용 권장 [cite: 2026-02-13]
      borderRadius: 12, // 시안의 둥근 모서리 반영 [cite: 2026-02-13]
      shadowColor: AppColors.primaryMain,
      boxShadow: const [
        BoxShadow(
          color: AppColors.primaryMain,
          blurRadius: 16, // 👈 퍼지는 픽셀 (준호 님이 원하신 것) [cite: 2026-01-02]
        ),
      ],
    );
  }

  Widget _buildSavingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.white, // background(color = Color(0xFFFCFCFC))
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: AppColors.secondaryMain, // spotColor = Color(0xFF6B9AE7) [cite: 2026-02-13]
            blurRadius: 16, // elevation = 16.dp
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Arrangement.SpaceBetween
        crossAxisAlignment: CrossAxisAlignment.center,     // Alignment.CenterVertically
        children: [
          Text(
            "지금까지 절약한 금액",
            style: AppTextStyles.ptdMedium(16).copyWith(color: AppColors.secondaryMain), // medium 16 [cite: 2026-02-13]
          ),
          Text(
            "732,500원",
            style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.secondaryMain),   // bold 24 [cite: 2026-02-13]
          ),
        ],
      ),
    );
  }

  Widget _buildChatNumCard() {
    return Row(
      // 두 카드 사이의 간격 12dp를 유지하면서 배치합니다. [cite: 2026-02-13]
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
        child: _buildStatItem("지난 3달 동안\n나눈 대화", "8건"),
        ),
        const SizedBox(width: 12), 
        Expanded(
          child: _buildStatItem("지금까지\n나눈 대화", "41건"),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Text(
            label,
            style: AppTextStyles.ptdMedium(16).copyWith(
              color: AppColors.black, // 시안의 텍스트 색상 적용 [cite: 2026-02-13]
            ),
          ),
          Text(
            value,
            // 수치는 강조를 위해 bold 28 적용 권장 [cite: 2026-02-13]
            style: AppTextStyles.ptdBold(24).copyWith(
              color: AppColors.black, // 시안의 텍스트 색상 적용 [cite: 2026-02-13]
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYellowBackground(BuildContext context) {
    const double diameter = 1515; // 요청하신 1515px 지름 [cite: 2026-02-13]
    final double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      // 1. 가로 중앙 정렬: (화면너비 - 지름) / 2 [cite: 2026-01-02]
      left: (screenWidth - diameter) / 2,
      // 2. 세로 위치: 시안의 곡선 높이에 맞춰 하단으로 배치 [cite: 2026-02-13]
      // 값을 더 내리거나 올려서 노란색 영역의 노출 정도를 조정하십시오.
      bottom: -1400, 
      child: Container(
        width: diameter,
        height: diameter,
        decoration: const BoxDecoration(
          color: AppColors.primaryMain,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

}