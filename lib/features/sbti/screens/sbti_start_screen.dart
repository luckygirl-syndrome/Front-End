import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/scheduler.dart';
import 'package:ttobaba/core/auth/auth_provider.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/sbti_background.dart';
import '../../../core/widgets/two_buttons.dart';
import 'package:go_router/go_router.dart';

class SbtiStartScreen extends ConsumerStatefulWidget {
  const SbtiStartScreen({super.key});

  @override
  ConsumerState<SbtiStartScreen> createState() => _SbtiStartScreenState();
}

class _SbtiStartScreenState extends ConsumerState<SbtiStartScreen> {
  @override
  void initState() {
    super.initState();
    // Refresh auth state after frame so app recognizes stored token without
    // causing immediate redirect from signup route.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(authStateProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // ⭐ AppBar 제거!
      body: Stack(
        children: [
          const SbtiBackground(), // 배경 블러
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  // ⭐ AppBar가 없으므로 상단 여백을 살짝 더 줍니다.
                  const SizedBox(height: 38),
                  Text(
                    '또바와 함께\n쇼핑 성향(S-BTI)을\n알아볼까요?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ptdBold(24),
                  ),

                  const SizedBox(height: 144),

                  Image.asset(
                    'assets/images/cats/sbti_cat.png',
                    height: 202,
                  ),
                  const Spacer(),

                  TwoButtons(
                    onLeftPressed: () {
                      context.push('/sbti_no_like');
                    },
                    onRightPressed: () {
                      context.push('/sbti_question');
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
