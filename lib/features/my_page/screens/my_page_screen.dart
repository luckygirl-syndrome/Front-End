// lib/features/my/view/my_page_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_navbar.dart';
import '../provider/my_page_state.dart';
import '../widgets/closet_stat_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/sbti_result_card.dart';
import 'package:ttobaba/features/sbti/providers/sbti_provider.dart'; // 👈 경로에 맞춰 추가

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myPageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 배경 노란색 레이어
          _buildBackgroundYellow(context),

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // 1. 헤더 영역 (프로필) [cite: 2026-02-16]
                ProfileHeader(state: state),

                // 2. 하단 콘텐츠 영역 (S-BTI, 옷장) [cite: 2026-02-16]
                _buildMainContent(context, state, ref),
              ],
            ),
          ),
        ],
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
            child: _buildClosetSection(state),
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
                    style: AppTextStyles.ptdRegular(12).copyWith(
                      color: AppColors.grey,
                    ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. 헤더 영역 (나의 취향 + 다시 설정하기)
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 0.0), // 헤더 좌우 여백 미세 조정
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('나의 취향', style: AppTextStyles.ptdBold(20)),
              GestureDetector(
                onTap: () {
                  context.push('/initial_question_start');
                },
                child: Row(
                  children: [
                    Text(
                      '다시 설정하기',
                      style: AppTextStyles.ptdRegular(12).copyWith(
                        color: AppColors.grey,
                      ),
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

        // 2. 쇼핑몰 카드
        _buildTasteCard(
          title: '내가 자주 이용하는 쇼핑몰',
          tags: ['무신사', '에이블리', '지그재그'],
        ),

        const SizedBox(height: 12), // 카드 사이 간격

        // 3. 추구미 카드
        _buildTasteCard(
          title: '나의 추구미',
          tags: ['모리걸'],
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
        color: Colors.white, // 하얀색 배경
        borderRadius: BorderRadius.circular(12), // 둥근 모서리
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
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
        style: AppTextStyles.ptdMedium(12).copyWith(color: Colors.white),
      ),
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
