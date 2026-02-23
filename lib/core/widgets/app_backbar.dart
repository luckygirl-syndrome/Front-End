import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // 💡 텍스트를 담을 변수 추가
  final int? currentPage;
  final VoidCallback onBackPressed;
  final PreferredSizeWidget? bottom; // 💡 1. bottom 필드 추가
  final double height;

  const AppBackBar(
      {super.key,
      this.currentPage,
      this.title, // 💡 선택사항으로 두면 텍스트 없는 페이지에서도 쓸 수 있어요.
      required this.onBackPressed,
      this.bottom, // 💡 2. 생성자에 추가
      this.height = 52});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      title: (title != null && title!.isNotEmpty)
          ? Text(title!, style: AppTextStyles.ptdBold(20))
          : null,
      leadingWidth: 32 + 20 + 16,
      leading: Container(
        margin: const EdgeInsets.only(left: 32),
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: onBackPressed,
          child: const Icon(Icons.arrow_back_ios_new,
              size: 20, color: AppColors.black),
        ),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );
}
