import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

import '../../../core/widgets/two_buttons.dart';

/// 시작 화면 전용 면 분할 배경 위젯

class InitialQuestionBackground extends StatelessWidget {
  const InitialQuestionBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              AppColors.primaryMain,
              Colors.white,
            ],
            stops: [0.0, 0.35, 0.351, 0.9],
          ),
        ),
      ),
    );
  }
}