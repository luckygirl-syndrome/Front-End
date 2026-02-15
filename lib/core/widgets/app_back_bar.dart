import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final VoidCallback onBackPressed;

  const AppBackBar({
    super.key,
    required this.currentPage,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        // 2. 왼쪽 여백을 32로 고정합니다.
        margin: const EdgeInsets.only(left: 32), 
        alignment: Alignment.centerLeft,
        child: InkWell(
          // IconButton 대신 InkWell을 쓰면 기본 패딩 없이 위치를 잡기 더 편합니다.
          onTap: onBackPressed,
          child: const Icon(
            Icons.arrow_back_ios_new, 
            size: 20, 
            color: AppColors.black
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}