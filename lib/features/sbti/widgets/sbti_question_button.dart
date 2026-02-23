import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import '../../../core/widgets/app_button.dart';

class SbtiQuestionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SbtiQuestionButton(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ⭐ 1. 전체적인 버튼의 바깥 그림자 (드롭 섀도우)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          // ⭐ 첫 번째: 넓고 은은하게 퍼지는 베이스 그림자
          BoxShadow(
            color: AppColors.primaryLight.withValues(alpha: 0.3), // 어두운 노랑 계열
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
          // ⭐ 두 번째: 버튼 바로 아래에 깔리는 진하고 좁은 그림자 (강조용)
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.5),
            blurRadius: 10,
            spreadRadius: -2, // 안으로 살짝 모아서 맺히는 느낌
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // ⭐ 2. 피그마 수치 기반 이너 섀도우 구현
            // 실제 버튼 배경 (Primary Main)
            AppButton(
              text: text,
              onPressed: onTap,
              borderRadius: 12,
            ),

            // 상단/좌측 밝은 이너 섀도우 (X: 1, Y: 1 느낌)
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: const Border(
                      top: BorderSide(color: AppColors.primaryLight, width: 2),
                      left: BorderSide(color: AppColors.primaryLight, width: 2),
                    ),
                  ),
                ),
              ),
            ),

            // 하단/우측 어두운 이너 섀도우 (X: -1, Y: -1 느낌)
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: const Border(
                      bottom:
                          BorderSide(color: AppColors.primaryDark, width: 2),
                      right: BorderSide(color: AppColors.primaryDark, width: 2),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
