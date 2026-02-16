import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

// 👈 1. StatelessWidget으로 변경하여 단일 진실 공급원(Single Source of Truth) 원칙 준수 [cite: 2026-01-02]
class HomeTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  const HomeTabBar({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 24, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTabItem('또바와 진대', 0),
                const SizedBox(width: 28),
                _buildTabItem('결정했나요?', 1),
                const SizedBox(width: 28),
                _buildTabItem('안 산 영수증', 2),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: AppColors.paleGrey),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    // 👈 2. 내부 변수 대신 부모가 넘겨준 currentIndex를 직접 사용 [cite: 2026-02-13]
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        // 👈 3. 클릭 시 부모의 상태를 바꾸도록 콜백 함수 실행 [cite: 2026-01-02]
        if (currentIndex != index) {
          onTabChanged(index);
        }
      },
      child: IntrinsicWidth(
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.ptdBold(18).copyWith(
                color: isSelected ? AppColors.black : AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 3,
              width: isSelected ? double.infinity : 0, 
              color: isSelected ? AppColors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}