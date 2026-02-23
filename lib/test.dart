import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/features/onboarding/screens/onboarding_screen.dart';

void main() {
  runApp(const TestOnboardingApp());
}

class TestOnboardingApp extends StatelessWidget {
  const TestOnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '온보딩 테스트',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryMain,
          surface: AppColors.white,
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}
