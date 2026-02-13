import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';

class AppTopbar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Modifier.width(390.dp) -> Fill 너비 반영
      height: 48, // Modifier.height(47.99961.dp) 반영
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Modifier.padding 반영
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양 끝으로 배치
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 왼쪽: 로고 이미지
          Image.asset(
            'assets/images/logo.png',
            height: 24, // 48px 높이 내에서 상하 패딩(12*2=24)을 제외한 가용 높이
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.pets), // 이미지 없을 시 대체
          ),

          // 오른쪽: 알림 아이콘
          const Icon(
            Icons.notifications_none_outlined,
            color: AppColors.black,
            size: 24,
          ),
        ],
      ),
    );
  }

  // Scaffold의 appBar에 넣기 위해 필요한 설정
  @override
  Size get preferredSize => const Size.fromHeight(48);
}