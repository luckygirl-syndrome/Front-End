// lib/features/my/view/my_page_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_navbar.dart';
import '../provider/my_page_state.dart';
import '../provider/profile_provider.dart';
import '../widgets/closet_stat_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/sbti_result_card.dart';

import 'package:ttobaba/features/sbti/providers/sbti_provider.dart'; // 👈 경로에 맞춰 추가

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💡 iOS의 getProfileInfo() 결과를 실시간 감시
    final profileAsync = ref.watch(profileDataProvider);
    final personaAsync = ref.watch(personaDataProvider);
    final state = ref.watch(myPageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: profileAsync.when(
        // ✅ 데이터 로드 성공 (iOS의 .success 케이스)
        data: (profile) => Stack(
          children: [
            // 배경 노란색 레이어
            _buildBackgroundYellow(context),

            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // 1. 헤더 영역 (프로필) [cite: 2026-02-16]
                  ProfileHeader(
                    profile: profile,
                    description: personaAsync.value?.description,
                  ),
                  // 2. 하단 콘텐츠 영역 (S-BTI, 옷장) [cite: 2026-02-16]
                  _buildMainContent(context, state, ref),
                ],
              ),
            ),
          ],
        ),
        // ✅ 로딩 중 (iOS의 startLoading())
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("에러: $err")),
      ),
      bottomNavigationBar: AppNavbar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) context.go('/chat');
          if (index == 1) context.go('/home');
        },
      ),
    );
  }

  // --- Private 빌더 메서드들 ---

  // 상단 오버스크롤 배경 [cite: 2026-02-16]
  Widget _buildBackgroundYellow(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      color: AppColors.primaryMain,
    );
  }

  Widget _buildMainContent(
      BuildContext context, MyPageState state, WidgetRef ref) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),

          const Divider(height: 2, color: AppColors.paleGrey),

          const SizedBox(height: 30),

          // 2. 여기서부터는 다시 좌우 여백이 필요하므로 Padding으로 감쌉니다. [cite: 2026-02-16]
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // S-BTI 섹션
                _buildSbtiSection(context, ref),

                const SizedBox(height: 40),

                // 옷장 섹션
                _buildClosetSection(state),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

// S-BTI 섹션 상세
  Widget _buildSbtiSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 💡 Row를 사용하여 타이틀과 버튼을 양 끝 배치
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('나의 S-BTI', style: AppTextStyles.ptdBold(20)),

            // 다시 설정하기 버튼
            GestureDetector(
              // 마이페이지 (MyPageScreen.dart) 내부
              onTap: () {
                // 1. 기존의 sbtiProvider 상태(currentIndex 등)를 완전히 초기화 [cite: 2026-02-17]
                ref.invalidate(sbtiProvider);

                // 2. 깨끗한 상태에서 'my' 파라미터만 들고 이동 [cite: 2026-02-17]
                context.push('/sbti_question?from=my');
              },
              child: Row(
                children: [
                  Text(
                    '다시 설정하기',
                    style: AppTextStyles.ptdRegular(12).copyWith(
                      color: AppColors.darkerGrey, // 시안의 연한 회색 느낌
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Color(0xFF9E9E9E),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
        const SbtiResultCard(),
      ],
    );
  }

  // 나의 옷장 섹션 상세 [cite: 2026-02-16]
  Widget _buildClosetSection(MyPageState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('나의 옷장', style: AppTextStyles.ptdBold(20)),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: ClosetStatCard(
                // 💡 const 제거 (String 연산 등이 들어갈 수 있으므로) [cite: 2026-02-16]
                title: '고심 끝에 구매한 옷',
                count: 18,
                price: '847,000원', // 💡 String으로 전달 [cite: 2026-02-16]
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ClosetStatCard(
                title: '아쉽지만 포기한 옷',
                count: 7,
                price: '289,000원', // 💡 String으로 전달 [cite: 2026-02-16]
              ),
            ),
          ],
        ),
      ],
    );
  }
}
