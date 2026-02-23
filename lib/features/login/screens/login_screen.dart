import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/features/login/widgets/login_footer.dart';
import 'package:ttobaba/features/login/widgets/login_header.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            // 1. 양옆에 고정 패딩을 줍니다 (팀장님 말씀하신 32 기준)
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72),
              // 2. 너무 큰 화면(태블릿 등)에서 무한정 늘어나지 않게 최대 너비만 제한합니다.
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Column(
                  mainAxisSize: MainAxisSize.min, // 중앙 정렬을 위해 최소 크기로
                  children: [
                    LoginHeader(),
                    SizedBox(height: 44), // 4의 배수 적용!
                    LoginForm(),
                    SizedBox(height: 40), // 4의 배수 적용!
                    LoginFooter(),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
