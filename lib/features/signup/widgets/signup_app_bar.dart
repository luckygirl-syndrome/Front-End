import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SignupAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final VoidCallback onBackPressed;

  const SignupAppBar({
    super.key,
    required this.currentPage,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: AppColors.black),
        onPressed: onBackPressed,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}