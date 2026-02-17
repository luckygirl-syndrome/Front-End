import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int currentPage;
  final VoidCallback onBackPressed;
  final double height;

  const AppBackBar({
    super.key,
    this.title = "",
    required this.currentPage,
    required this.onBackPressed,
    this.height = 52,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      leadingWidth: 32 + 20 + 16,
      leading: Container(
        margin: const EdgeInsets.only(left: 32), 
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: onBackPressed,
          child: const Icon(
            Icons.arrow_back_ios_new, 
            size: 20, 
            color: AppColors.black
          ),
        ),
      ),

      title: title.isNotEmpty 
        ? Text(
            title,
            style: AppTextStyles.ptdBold(18).copyWith(color: AppColors.black),
          ) 
        : null,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(height);
}