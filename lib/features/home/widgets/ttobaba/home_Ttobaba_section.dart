import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_button.dart';
import 'package:ttobaba/core/widgets/link_input_popup.dart';

class HomeTtobabaSection extends StatelessWidget {
  const HomeTtobabaSection({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      // 배경 원이 잘리지 않도록 Clip.none 설정이 필요할 수 있습니다. [cite: 2026-01-02]
      child: Stack(
        clipBehavior: Clip.none, 
        children: [
          // 1. 가장 아래 레이어: 노란색 원 배경 [cite: 2026-02-13]
          _buildYellowBackground(context),

          // 2. 위 레이어: 기존 콘텐츠 (패딩 적용) [cite: 2026-02-13]
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 상단 그룹
                Column(
                  children: [
                    _buildTitle(),
                    const SizedBox(height: 32),
                    _buildCharacterImage(),
                    const SizedBox(height: 32),
                    _buildActionButton(context),
                  ],
                ),
                // 하단 그룹
                Column(
                  children: [
                    _buildSavingCard(),
                    const SizedBox(height: 12),
                    _buildChatNumCard(),
                  ],
                )
              ],
            ),
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