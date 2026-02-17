import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailChatScreen extends ConsumerWidget {
  const DetailChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            _buildProductHeader(), // 고정 영역 (흰색 배경)
            _buildActionButtons(), // 고정 영역 (흰색 배경)

            // 👈 채팅 영역: 배경은 고정되고 메시지만 스크롤됨 [cite: 2026-02-16]
            Expanded(
              child: Stack(
                children: [
                  // 1. 고정 배경 그라데이션
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.white, AppColors.primaryMain],
                        ),
                      ),
                    ),
                  ),

                  // 2. 스크롤되는 채팅 내용
                  ListView(
                    padding: EdgeInsets.zero, // 기본 패딩 제거 [cite: 2026-02-11]
                    children: [
                      _buildChatContent(context),
                    ],
                  ),
                ],
              ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 12, 32, 0),
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // 👈 Arrangement.SpaceBetween 구현 [cite: 2026-02-16]
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. 왼쪽: 뒤로가기 버튼
          GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
              size: 24,
            ),
          ),

          // 2. 중앙: 디자인상 빈 공간 (Auto)
          const Spacer(),

          // 3. 오른쪽: 아이콘 그룹 (장바구니 + 더보기)
          Row(
            children: [
              const Icon(Icons.shopping_bag_outlined,
                  color: AppColors.black, size: 24),
              const SizedBox(width: 16), // 아이콘 사이 간격
              const Icon(Icons.more_horiz, color: AppColors.black, size: 24),
            ],
          ),
        ],
      ),
    );
  }

  // 1. 상단 상품 정보 레이아웃
  Widget _buildProductHeader() {
    return Container(
      // 디자인 가이드 수치: 좌32, 상32, 우32, 하20
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 20),
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. 왼쪽 상품 이미지 (80x80 고정) [cite: 2026-02-16]
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/product_sample.png',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),

          // 2. 오른쪽 텍스트 영역 (이미지 높이 80에 맞춤)
          Expanded(
            child: SizedBox(
              height: 80, // 👈 이미지 높이와 동일하게 설정하여 상하 정렬 기준 마련 [cite: 2026-02-16]
              child: Column(
                // 👈 상단과 하단을 양 끝으로 밀어 이미지 라인에 맞춤
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // [상단 그룹] 브랜드 + 상품명
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "에이블리",
                        style: AppTextStyles.ptdBold(12)
                            .copyWith(color: AppColors.black),
                      ),
                      Text(
                        "❤️기모선택❤️찰랑 하이웨스트 와이드 롱팬츠",
                        style: AppTextStyles.ptdRegular(12),
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),

                  // [하단 그룹] 태그 + 가격
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryMain,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "구매 포기",
                          style: AppTextStyles.ptdMedium(12)
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "22,200원",
                        style: AppTextStyles.ptdBold(20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. 중앙 액션 버튼
  Widget _buildActionButtons() {
    return Container(
      // 디자인 가이드: 좌우 32, 상하 20 반영
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 12),
      color: AppColors.white,
      child: Row(
        children: [
          // 1. 내 평가 확인하기 버튼
          Expanded(
            child: AppButton(
              text: "내 평가 확인하기",
              onPressed: () {},
              backgroundColor: AppColors.white,
              textColor: AppColors.black,
              borderColor: AppColors.black,
              borderWidth: 1,
              textStyle: AppTextStyles.ptdBold(12),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),

          // 2. 버튼 사이 간격 20px
          const SizedBox(width: 20),

          // 3. 저 사실... 샀어요 버튼
          Expanded(
            child: AppButton(
              text: "저 사실... 샀어요",
              onPressed: () {},
              backgroundColor: AppColors.black,
              textColor: AppColors.white,
              borderColor: AppColors.black,
              textStyle: AppTextStyles.ptdBold(12),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  // 3. 채팅 말풍선 영역
  // 1. context 인자 추가
  Widget _buildChatContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24), // 가이드 24px 반영
      child: Column(
        children: [
          // 2. 하위 함수에 context 전달
          _buildChatBubble(context, "Look it's a new me...",
              isMine: false, time: "오후 8:51"),
          const SizedBox(height: 8), // 간격 16px
          _buildChatBubble(context, "어쩌라고", isMine: true, time: "오후 8:51"),
          const SizedBox(height: 8), // 간격 16px
          _buildChatBubble(context, "Look it's a new me...",
              isMine: false, time: "오후 8:51"),
          const SizedBox(height: 8), // 간격 16px
          _buildChatBubble(context, "어쩌라고", isMine: true, time: "오후 8:51"),
        ],
      ),
    );
  }

  Widget _buildChatBubble(BuildContext context, String message,
      {required bool isMine, required String time}) {
    return Align(
      // 1. 내 메시지는 오른쪽, 상대 메시지는 왼쪽 정렬
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            // 최대 너비를 화면의 70% 정도로 제한하여 가독성 확보
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              // 2. 비대칭 모서리 적용 [cite: 2026-02-16]
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                // 상대(isMine: false) -> 왼쪽 아래 0, 나(isMine: true) -> 오른쪽 아래 0
                bottomLeft: Radius.circular(isMine ? 12 : 0),
                bottomRight: Radius.circular(isMine ? 0 : 12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Text(
              message,
              style: AppTextStyles.ptdMedium(16).copyWith(height: 1.4),
            ),
          ),
          const SizedBox(height: 8),
          // 3. 시간 표시
          Text(
            time,
            style: AppTextStyles.ptdMedium(8).copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }

  // 4. 하단 입력창
  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: AppColors.white,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                decoration: BoxDecoration(
                    color: AppColors.paleGrey,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  // 입력되는 텍스트 스타일 (필요시 추가)
                  style: AppTextStyles.ptdMedium(16),
                  decoration: InputDecoration(
                    hintText: "메시지 쓰기..",
                    border: InputBorder.none,
                    // 👈 요청하신 스타일 반영: Medium/12, AppColors.grey
                    hintStyle: AppTextStyles.ptdMedium(12).copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                  color: AppColors.primaryMain, shape: BoxShape.circle),
              child:
                  const Icon(Icons.send_rounded, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
