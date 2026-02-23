// lib/features/auth/widgets/login_header.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart'; // 프로젝트 경로에 맞게 수정하세요
import 'package:flutter_svg/flutter_svg.dart'; // 💡 임포트 필수!

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/logos/logo.svg',
          height: 70,
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
