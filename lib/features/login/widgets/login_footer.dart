// lib/features/auth/widgets/login_footer.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_text_styles.dart'; // 프로젝트 경로에 맞게 수정하세요
import '../../../../core/theme/app_colors.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '아직 회원이 아닌가요?',
          style: AppTextStyles.ptdRegular(12).copyWith(
            color: AppColors.lightGrey,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () => context.push('/signup'),
          child: Text(
            '회원가입',
            style: AppTextStyles.ptdRegular(12).copyWith(
              color: AppColors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}