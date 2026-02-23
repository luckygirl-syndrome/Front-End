import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/features/chat/providers/chat_provider.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_navbar.dart';
import 'package:ttobaba/features/chat/widgets/chat_item.dart';
import 'package:ttobaba/features/chat/screens/detail_chat_screen.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // 1. 전체 구조를 Column으로 잡아 상단을 고정함 [cite: 2026-02-16]
      body: Column(
        children: [
          _buildFixedTitleHeader(), // 고정 타이틀 영역
          Expanded(
            child: _buildScrollableBody(context, ref), // 스크롤 가능 영역
          ),
        ],
      ),
      floatingActionButton: _buildFAB(),
      bottomNavigationBar: AppNavbar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            context.push('/home');
          } else if (index == 2) {
            context.push('/my_page');
          }
        },
      ),
    );
  }

  // 상단 고정 타이틀 (스크롤해도 고정) [cite: 2026-02-16]
  Widget _buildFixedTitleHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
          horizontal: 32, vertical: 32), // 시안의 32px 반영
      alignment: Alignment.centerLeft,
      child: SafeArea(
        bottom: false,
        child: Text(
          "또바와 진지한 대화",
          style:
              AppTextStyles.ptdExtraBold(24).copyWith(color: AppColors.black),
        ),
      ),
    );
  }

  // 스크롤 가능한 본문 영역
  Widget _buildScrollableBody(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // 1. 배경 영역: Positioned.fill을 사용하여 Stack의 전체 높이를 따라가게 함
              Positioned.fill(
                child: Container(
                  color: AppColors.primaryMain,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildRecentChatCard(context),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 필터 및 리스트 영역 (흰색 배경 위)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFilterRow(),
                const SizedBox(height: 24),
                _buildChatList(context, ref),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentChatCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Container(
        padding: const EdgeInsets.all(20), // 카드 내부 패딩
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
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
            Text(
              "가장 최근에 나눈 대화",
              style: AppTextStyles.ptdBold(16),
            ),
            const SizedBox(height: 12),

            // 3. 기존 ChatItem 위젯 사용 (고민 중 상태 반영)
            ChatItem(
              status: ItemStatus.considering, // '고민 중' 뱃지 표시
              price: "13,410원",
              date: "어제",
              title: "[단독] [🔴라이브특가/+뉴컬러/50만장돌파🏆/made] 시오 니트",
              imageUrl: "assets/images/product_sample.png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailChatScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterRow() {
    return Row(
      children: [
        _buildFilterChip("전체", isSelected: true),
        const SizedBox(width: 12),
        _buildFilterChip("결정 완료"),
        const SizedBox(width: 12),
        _buildFilterChip("고민 중"),
      ],
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryMain : AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.primaryMain),
      ),
      child: Text(label, style: AppTextStyles.ptdMedium(12)),
    );
  }

  Widget _buildChatList(BuildContext context, WidgetRef ref) {
    // 1. Provider 구독
    final chatState = ref.watch(chatProvider);
    final chatList = chatState.chatList;

    if (chatState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: chatList.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 32, thickness: 0.5),
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return ChatItem(
          status: ItemStatus.considering, // 실제 데이터 연동 시 변경 필요
          price: chat['price'],
          date: chat['date'],
          title: chat['title'],
          imageUrl: chat['imageUrl'],
          onTap: () {
            // GoRouter로 이동 (추후 라우터 설정 후 적용)
            // context.push('/detail_chat');

            // 현재는 기존 방식 유지하되, 추후 수정
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailChatScreen()),
            );
          },
        );
      },
    );
  }

  Widget _buildFAB() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 24),
      child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // 노란색 그림자 설정
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryMain,
                blurRadius: 16, // 요청하신 16px 블러
                offset: Offset.zero, // 중앙에서 퍼지도록 설정
              ),
            ],
          ),
          child: SizedBox(
            width: 64,
            height: 64,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.primaryMain,
              shape: const CircleBorder(),
              elevation: 0, // 👈 요청하신 대로 elevation 제거 (기본 그림자 삭제)
              child: const Icon(Icons.add, color: AppColors.white, size: 48),
            ),
          )),
    );
  }
}
