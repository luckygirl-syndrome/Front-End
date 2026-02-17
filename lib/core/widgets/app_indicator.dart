import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';

class AppIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const AppIndicator({
    super.key,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 34,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPage,
          (index) => Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index ? AppColors.black : AppColors.lightGrey,
            ),
          ),
        ),
      ),
    );
  }
}