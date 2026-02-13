import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SignupIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const SignupIndicator({
    super.key,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPage, (index) => Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index ? AppColors.black : AppColors.lightGrey,
        ),
      )),
    );
  }
}