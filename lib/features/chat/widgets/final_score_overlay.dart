import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/theme/app_text_styles.dart';

/// 채팅 종료 후에 표시되는 중앙 팝업(“당신의 또바바 지수는 …”).
/// 하단 배너(검은색 + 또바바 지수 박스)는 실제 채팅 화면에서 렌더링하고,
/// 이 위젯은 팝업만 담당한다.
class FinalScoreOverlay extends StatelessWidget {
  final int finalScore;
  final VoidCallback? onClosePopup;

  const FinalScoreOverlay({
    super.key,
    required this.finalScore,
    this.onClosePopup,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // 바깥 영역 터치 시 닫기
        if (onClosePopup != null) {
          onClosePopup!();
        }
      },
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: GestureDetector(
            // 카드 영역 터치는 바깥 onTap으로 전파되지 않도록 막기
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // 메인 카드 (화면 정중앙 기준)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '당신의 또바바 지수는',
                          style: AppTextStyles.ptdBold(24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        // 일러스트 이미지
                        Image.asset(
                          'assets/images/avatars/image 200.png',
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          '$finalScore점',
                          style: AppTextStyles.ptdExtraBold(40),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '입니다!',
                          style: AppTextStyles.ptdMedium(18),
                        ),
                      ],
                    ),
                  ),
                  // 카드 기준 오른쪽 위에 떠 있는 닫기 버튼
                  Positioned(
                    top: -52, // 카드 위로 40(버튼) + 12 간격
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        if (onClosePopup != null) {
                          onClosePopup!();
                        }
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: SvgPicture.asset(
                        'assets/icons/close_button.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

