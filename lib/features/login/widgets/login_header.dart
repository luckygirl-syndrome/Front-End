// lib/features/auth/widgets/login_header.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart'; // 프로젝트 경로에 맞게 수정하세요

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 70,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 28),
        Text(
          '또 사기 전에', 
          style: AppTextStyles.ptdMedium(24),
        ),
        Transform.translate(
          offset: const Offset(0, -5),
          child: Text(
            '또바바', 
            style: AppTextStyles.ptdExtraBold(40),
          ),
        ),
      ],
    );
  }
}