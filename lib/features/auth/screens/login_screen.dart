import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/app_button.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 공통 너비 설정
    final double contentWidth = MediaQuery.of(context).size.width * 0.63;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: contentWidth,
              child: const Column(
                children: [
                  _HeaderSection(),

                  SizedBox(height: 30),

                  _LoginForm(),

                  SizedBox(height: 35),

                  _FooterSection(),

                   SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 1. 헤더: 로고와 타이틀
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/logo.png'),
        const SizedBox(height: 28),
        Text('또 사기 전에', style: AppTextStyles.ptdMedium(24)),
        Transform.translate(
          offset: const Offset(0, -5),
          child: Text('또바바', style: AppTextStyles.ptdExtraBold(40)),
        ),
      ],
    );
  }
}

// 2. 폼: 입력창과 버튼 (여기에 나중에 Controller들을 몰아넣으면 관리하기 편해요!)
class _LoginForm extends StatelessWidget {
  const _LoginForm();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 텍스트 라벨 왼쪽 정렬
      children: [
        Text('아이디', style: AppTextStyles.ptdBold(12).copyWith(color: AppColors.black0)),
        const SizedBox(height: 8),
        const AppTextField(hint: '아이디를 입력해주세요', fontSize: 12, focusedBorderColor: Colors.yellow),
        
        const SizedBox(height: 20),
        
        Text('비밀번호', style: AppTextStyles.ptdBold(12).copyWith(color: AppColors.black0)),
        const SizedBox(height: 8),
        const AppTextField(hint: '비밀번호를 입력해주세요', fontSize: 12, obscureText: true, focusedBorderColor: Colors.yellow),
        
        const SizedBox(height: 12),
        AppButton(
          text: '시작하기',
          onPressed: () => context.go('/home'),
          borderRadius: 4,
          height: 40,
          textStyle: AppTextStyles.ptdBold(12).copyWith(color: AppColors.white0),
        ),
      ],
    );
  }
}

// 3. 푸터: 회원가입 링크
class _FooterSection extends StatelessWidget {
  const _FooterSection();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('아직 회원이 아닌가요?', 
          style: AppTextStyles.ptdRegular(12).copyWith(color: AppColors.grey0)),

        const SizedBox(width: 8),
        
        GestureDetector(
          onTap: () => context.push('/signup'),
          child: Text('회원가입',
            style: AppTextStyles.ptdRegular(12).copyWith(
              color: AppColors.black0,
              decoration: TextDecoration.underline,
            )),
        ),
      ],
    );
  }
}