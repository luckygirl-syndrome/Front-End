import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppNavbar extends StatelessWidget {
  final int currentIndex; // 현재 선택된 인덱스 (0: 채팅, 1: 홈, 2: 마이)
  final Function(int) onTap; // 탭 클릭 시 실행할 함수

  const AppNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity, // 390 고정 대신 화면 너비 꽉 채우기
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x261C1C1C), // 투명도 약 15%의 그림자
            blurRadius: 12,
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // Row가 부모의 가로 너비를 다 쓰도록 보장
            mainAxisSize: MainAxisSize.max,
            children: [
              _NavbarItem(
                  name: 'chat',
                  label: '채팅',
                  isSelected: currentIndex == 0,
                  onTap: () => onTap(0)),
              SizedBox(width: screenWidth * 0.01),
              _NavbarItem(
                  name: 'home',
                  label: '홈',
                  isSelected: currentIndex == 1,
                  onTap: () => onTap(1)),
              SizedBox(width: screenWidth * 0.01),
              _NavbarItem(
                  name: 'my',
                  label: '마이',
                  isSelected: currentIndex == 2,
                  onTap: () => onTap(2)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavbarItem extends StatelessWidget {
  final String name; // 아이콘 이름 (chat, home, my)
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavbarItem({
    required this.name,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. 상태에 따라 아이콘 경로 자동 생성 (chat -> chat_fill)
    final String iconPath =
        isSelected ? 'assets/icons/${name}_fill.png' : 'assets/icons/$name.png';

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style:
                AppTextStyles.ptdRegular(12).copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
