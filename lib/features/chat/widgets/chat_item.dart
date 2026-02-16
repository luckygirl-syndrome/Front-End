import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

// 3가지 상태 정의
enum ItemStatus {
  considering, // 고민 중
  gaveUp,      // 결정 완료 - 구매 포기
  purchased,   // 결정 완료 - 구매
}

class ChatItem extends StatelessWidget {
  final ItemStatus status; // 상태 변수 추가

  const ChatItem({
    super.key,
    this.status = ItemStatus.considering, // 기본값: 고민 중
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 68,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/product_sample.png',
              width: 64, height: 64, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 64, height: 64, color: AppColors.lightGrey,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          
          const SizedBox(width: 20), // 이미지와 텍스트 사이 간격

          // 2. 텍스트 정보 영역 (Expanded로 남은 공간 Fill)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 상단/하단 끝 정렬
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // [상단 Row] 가격 <--- spaceBetween ---> (태그 + 20px + 날짜)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center, // 세로 중앙 정렬
                  children: [
                    // 왼쪽: 가격
                    Text(
                      '13,410원',
                      style: AppTextStyles.ptdBold(20).copyWith(
                        color: AppColors.black
                      ),
                    ),
                    
                    // 오른쪽 그룹: [태그] -- 20px -- [날짜]
                    Row(
                      children: [
                        _buildTag(status),
                        
                        const SizedBox(width: 20), // 👈 요청하신 20 패딩
                        
                        // 날짜 + 화살표
                        Row(
                          children: [
                            const SizedBox(width: 4),
                            Row(
                              children: [
                                Text('어제', style: AppTextStyles.ptdRegular(12).copyWith(color: AppColors.grey)),
                                const Icon(Icons.chevron_right, color: AppColors.grey, size: 16),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                // [하단 텍스트] 2줄 제한, 가로 꽉 채움
                Text(
                  '[단독] [🔴라이브특가/+뉴컬러/50만장돌파🏆/made] 시오 니트 시오 니트 시오 니트 시오 니트',
                  style: AppTextStyles.ptdRegular(12).copyWith(
                    color: AppColors.black
                  ),
                  overflow: TextOverflow.ellipsis, // 말줄임표 (...)
                  maxLines: 2, // 👈 최대 2줄까지 허용
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 상태별 태그 디자인 (Modifier 코드 반영)
  Widget _buildTag(ItemStatus status) {
    // 노란색 상수 (0xFFFFC63D)
    const highlightColor = AppColors.primaryMain;

    String text;
    Color textColor;
    Color? backgroundColor;
    BoxBorder? border;

    switch (status) {
      case ItemStatus.considering:
        text = '고민 중';
        textColor = AppColors.lightGrey;
        border = Border.all(color: AppColors.lightGrey);
        backgroundColor = Colors.white; // 배경 투명/흰색
        break;
      case ItemStatus.gaveUp:
        text = '구매 포기'; // 공간 제약상 '결정 완료' 생략 (63dp 규격)
        textColor = Colors.white;
        backgroundColor = highlightColor; // 노란색 채우기
        border = null; // 테두리 없음
        break;
      case ItemStatus.purchased:
        text = '구매 완료';
        textColor = highlightColor;
        backgroundColor = Colors.white;
        border = Border.all(color: highlightColor); // 노란색 테두리
        break;
    }

    return Container(
      // 👈 width, height 고정값을 명백히 삭제합니다. [cite: 2026-01-02]
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4), // Modifier의 padding 6 반영 (글자 크기 고려 4로 조정)
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTextStyles.ptdMedium(8).copyWith(
          color: textColor,
          height: 1.0, 
        ),
      ),
    );
  }
}