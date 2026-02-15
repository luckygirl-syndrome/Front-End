import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/sbti_background.dart';
import '../../../core/widgets/two_buttons.dart';
import 'package:go_router/go_router.dart';

class SbtiStartScreen extends ConsumerWidget {
  const SbtiStartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  // 캐릭터 이미지 (파일명 sbti_cat.png로 확인!)
                  Image.asset(
                    'assets/images/sbti_cat.png',
                    height: 202,
                    // ⭐ 이미지가 없을 때 에러 방지용 (선택사항)
                  ),
                  const Spacer(),

                  TwoButtons(
                    onDislike: () {
                      context.go('/sbti_no_like');
                    },
                    onLike: () {
                      context.go('/sbti_question');
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