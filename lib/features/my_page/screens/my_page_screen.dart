// lib/features/my/view/my_page_screen.dart
import 'package:flutter/material.dart';
import 'package:ttobaba/core/utils/format_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_navbar.dart';
import '../provider/my_page_state.dart';
// import '../provider/profile_provider.dart'; // Deprecated
import '../widgets/closet_stat_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/sbti_result_card.dart';
import 'package:ttobaba/features/sbti/providers/persona_provider.dart';
import 'package:ttobaba/features/my_page/providers/user_provider.dart';
import 'package:ttobaba/features/sbti/providers/sbti_provider.dart';
import 'package:ttobaba/features/my_page/providers/shop_provider.dart';
import 'package:ttobaba/features/my_page/providers/chugume_provider.dart';
import 'package:ttobaba/features/initial_question/provider/initial_question_provider.dart';
import 'package:ttobaba/features/my_page/providers/closet_provider.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💡 iOS의 getProfileInfo() 결과를 실시간 감시
    final userAsync = ref.watch(userProvider);
    final personaAsync = ref.watch(personaStateProvider);
    final state = ref.watch(myPageProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: userAsync.when(
        // ✅ 데이터 로드 성공
        data: (profile) {
          if (profile == null) return const Center(child: Text("프로필 정보 없음"));
          return Stack(
            children: [
              // 배경 노란색 레이어
              _buildBackgroundYellow(context),

              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // 1. 헤더 영역 (프로필)
                    ProfileHeader(
                      profile: profile,
                      personaType: personaAsync.value?.personaType,
                      isLoadingPersona: personaAsync.isLoading,
                    ),
                    // 2. 하단 콘텐츠 영역
                    _buildMainContent(context, state, ref),
                  ],
                ),
              ),
            ],
          );
        },
        // ✅ 로딩 중
        loading: () => const Center(child: CircularProgressIndicator()),
        // ✅ 에러 발생
        error: (err, stack) => Center(child: Text("에러: $err")),
      ),
      bottomNavigationBar: AppNavbar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            context.push('/chat_list');
          } else if (index == 1) {
            context.push('/home');
          }
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
    BuildContext context,
    MyPageState state,
    WidgetRef ref,
  ) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Divider(height: 2, color: AppColors.paleGrey),
          const SizedBox(height: 30),

          // 1. S-BTI & 나의 취향 섹션 (좌우 패딩 적용)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSbtiSection(context, ref),
                const SizedBox(height: 40),
                _buildMyTasteSection(context, ref),
                const SizedBox(height: 40),
              ],
            ),
          ),

          // 2. 구분선 (Full Width)
          const Divider(height: 1, color: AppColors.paleGrey),
          const SizedBox(height: 40),

          // 3. 나의 옷장 섹션
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: _buildClosetSection(state, ref),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // S-BTI 섹션 상세
  Widget _buildSbtiSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('나의 S-BTI', style: AppTextStyles.ptdBold(20)),
            GestureDetector(
              onTap: () {
                ref.invalidate(sbtiProvider);
                context.push('/sbti_question?from=my');
              },
              child: Row(
                children: [
                  Text(
                    '다시 설정하기',
                    style: AppTextStyles.ptdRegular(
                      12,
                    ).copyWith(color: AppColors.grey),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: AppColors.grey,
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

  // [MODIFY] 나의 취향 섹션
  Widget _buildMyTasteSection(BuildContext context, WidgetRef ref) {
    // 실시간 데이터 구독
    final shopsAsync = ref.watch(favoriteShopsProvider);
    final chugumeAsync = ref.watch(chugumeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. 헤더 영역 (나의 취향 + 다시 설정하기)
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
          ), // 헤더 좌우 여백 미세 조정
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('나의 취향', style: AppTextStyles.ptdBold(20)),
              GestureDetector(
                onTap: () {
                  // 👉 상태 리셋 후 바로 Q1으로 이동
                  ref.read(initialQuestionProvider.notifier).reset();
                  context.push('/initial_question?from=my');
                },
                child: Row(
                  children: [
                    Text(
                      '다시 설정하기',
                      style: AppTextStyles.ptdRegular(
                        12,
                      ).copyWith(color: AppColors.grey),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20), // 헤더와 카드 사이 간격
        // 2. 쇼핑몰 카드 (실제 데이터 연동)
        _buildTasteCard(
          title: '내가 자주 이용하는 쇼핑몰',
          tags: shopsAsync.when(
            data: (shops) =>
                shops.isEmpty ? ['미설정'] : shops.map((s) => s.label).toList(),
            loading: () => ['로딩 중...'],
            error: (_, __) => ['불러오기 실패'],
          ),
        ),

        const SizedBox(height: 12), // 카드 사이 간격
        // 3. 추구미 카드 (실제 데이터 연동)
        _buildTasteCard(
          title: '나의 추구미',
          tags: chugumeAsync.when(
            data: (type) => type != null ? [type.label] : ['미설정'],
            loading: () => ['로딩 중...'],
            error: (_, __) => ['불러오기 실패'],
          ),
        ),
      ],
    );
  }

  // [NEW] 공통 카드 위젯 (하얀색 박스 스타일)
  Widget _buildTasteCard({required String title, required List<String> tags}) {
    return Container(
      width: double.infinity, // 가로 꽉 채우기
      padding: const EdgeInsets.all(20), // 내부 여백 20px (시안 기준)
      decoration: BoxDecoration(
        color: AppColors.white, // 하얀색 배경
        borderRadius: BorderRadius.circular(12), // 둥근 모서리
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.ptdBold(16)),
          const SizedBox(height: 12), // 제목과 태그 사이 간격
          Wrap(
            spacing: 8, // 태그 옆 간격
            runSpacing: 8, // 태그 줄바꿈 간격
            children: tags.map((tag) => _buildTag(tag)).toList(),
          ),
        ],
      ),
    );
  }

  // [CHECK] 태그 디자인 (노란색 배경)
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryMain, // 시안의 노란색
        borderRadius: BorderRadius.circular(4), // 태그 모서리 둥글기 (조절 가능)
      ),
      child: Text(
        text,
        style: AppTextStyles.ptdMedium(12).copyWith(color: AppColors.white),
      ),
    );
  }

  // 나의 옷장 섹션 상세 [cite: 2026-02-16]
  Widget _buildClosetSection(MyPageState state, WidgetRef ref) {
    final closetStatsAsync = ref.watch(closetStatsStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('나의 옷장', style: AppTextStyles.ptdBold(20)),
        const SizedBox(height: 16),
        closetStatsAsync.when(
          data: (stats) {
            final boughtCount = stats?.boughtCount ?? 0;
            final boughtPrice = stats?.boughtPrice ?? 0;
            final droppedCount = stats?.droppedCount ?? 0;
            final droppedPrice = stats?.droppedPrice ?? 0;

            return Row(
              children: [
                Expanded(
                  child: ClosetStatCard(
                    title: '고심 끝에 구매한 옷',
                    count: boughtCount,
                    price: formatPriceWithUnit(boughtPrice, zeroLabel: '0원'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ClosetStatCard(
                    title: '아쉽지만 포기한 옷',
                    count: droppedCount,
                    price: formatPriceWithUnit(droppedPrice, zeroLabel: '0원'),
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const Center(child: Text("불러오기 실패")),
        ),
      ],
    );
  }
}
