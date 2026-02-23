import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ttobaba/features/onboarding/widgets/terms_agreement_sheet.dart';
import 'package:ttobaba/core/widgets/app_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showTermsSheet() {
    // await result and navigate when confirmed inside the sheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const TermsAgreementSheet(),
    ).then((result) async {
      if (result == true) {
        try {
          // mark onboarding as seen so future app starts go to login instead
          const storage = FlutterSecureStorage();
          await storage.write(key: 'has_seen_onboarding', value: 'true');
        } catch (e) {
          // ignore storage errors; still proceed
        }

        if (!mounted) return;
        try {
          context.push('/login');
        } catch (e) {
          // ignore if route not available in test
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // 1. 상단 이미지 배경 영역 (440 / 844 비율)
          SizedBox(
            height: MediaQuery.of(context).size.height * (440 / 844),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.white, AppColors.primaryMain],
                    ),
                  ),
                );
              },
            ),
          ),

          // 상단 이미지와 인디케이터 사이 16px
          const SizedBox(height: 16),

          // 2. 인디케이터
          AppIndicator(
            currentPage: _currentPage,
            totalPage: 6,
          ),

          const SizedBox(height: 40),
          // 텍스트 영역
          Text(
            '어쩌구 저쩌구 어쩌구',
            style: AppTextStyles.ptdExtraBold(24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 0),
          Text(
            '저쩌구',
            style: AppTextStyles.ptdExtraBold(32).copyWith(
              color: AppColors.primaryMain,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            '어쩌구 저쩌구 어쩌구',
            style: AppTextStyles.ptdRegular(16).copyWith(
              color: AppColors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),

          // 3. 하단 시작하기 버튼
          Container(
            color: AppColors.primaryMain,
            width: double.infinity,
            child: SafeArea(
              top: false,
              child: InkWell(
                onTap: _showTermsSheet,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Text(
                    '시작하기',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ptdExtraBold(24).copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
