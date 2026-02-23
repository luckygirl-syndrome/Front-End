import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    // 1. 약간의 지연 (스플래시 노출)
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // 2. 토큰 확인
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: 'access_token');

    if (!mounted) return;

    // 3. 이동 로직: 토큰이 있으면 홈으로, 없으면 바로 로그인으로 이동
    if (token != null && token.isNotEmpty) {
      context.go('/home');
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '또 사기 전에 또바바',
              style: AppTextStyles.ptdExtraBold(24).copyWith(
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 16),
            SvgPicture.asset(
              'assets/images/logos/logo.svg',
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
