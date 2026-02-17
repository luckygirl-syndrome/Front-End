import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../sbti/providers/sbti_provider.dart';

class SbtiResultCard extends ConsumerWidget {
  // 💡 ConsumerWidget으로 변경
  const SbtiResultCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💡 실제 Provider 상태를 구독합니다.
    final sbtiState = ref.watch(sbtiProvider);
    final scores = sbtiState.scores;

    // 🎨 각 유형별 비율 계산 (각 유형당 질문 3개 기준)
    // 0.5가 중간값이며, 한쪽 유형이 많을수록 1.0 또는 0.0에 가까워집니다.
    double getRatio(String topType, String bottomType) {
      int topScore = scores[topType] ?? 0;
      int bottomScore = scores[bottomType] ?? 0;
      int total = topScore + bottomScore;

      if (total == 0) return 0.5; // 데이터가 없으면 중간
      return topScore / total; // 상단 유형의 비율 (0.0 ~ 1.0)
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _SbtiBar(
              topLabel: 'D',
              topSub: '도파민',
              bottomLabel: 'N',
              bottomSub: '생존',
              value: getRatio('D', 'N')), // 💡 계산된 비율 전달
          _SbtiBar(
              topLabel: 'S',
              topSub: '사회 자극',
              bottomLabel: 'A',
              bottomSub: '미적 자극',
              value: getRatio('S', 'A')), // 💡 계산된 비율 전달
          _SbtiBar(
              topLabel: 'M',
              topSub: '마이웨이',
              bottomLabel: 'T',
              bottomSub: '유행',
              value: getRatio('M', 'T')), // 💡 계산된 비율 전달
        ],
      ),
    );
  }
}

class _SbtiBar extends StatelessWidget {
  final String topLabel, topSub, bottomLabel, bottomSub;
  final double value; // 0.0 ~ 1.0

  const _SbtiBar({
    required this.topLabel,
    required this.topSub,
    required this.bottomLabel,
    required this.bottomSub,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    const double barHeight = 80.0;
    const double barWidth = 4.0;

    // 💡 노란색이 가득 차지 않도록 비율을 조정 (최대 85%만 차오르게)
    const double maxVisualRatio = 0.85;

    // 🎨 점수 계산
    final bool isTopActive = value >= 0.5;
    // 실제 표시할 높이: 최소값(바 두께만큼) ~ 최대값(barHeight * 0.85)
    final double displayValue =
        (isTopActive ? value : (1 - value)) * maxVisualRatio;

    const Color activeColor = AppColors.black;
    const Color inactiveColor = AppColors.lightGrey; // 연한 회색

    return Column(
      children: [
        // 위쪽 라벨 (점수가 높으면 검은색, 낮으면 회색)
        Text(topLabel,
            style: AppTextStyles.ptdBold(20).copyWith(
                color: isTopActive ? activeColor : inactiveColor, height: 1.0)),
        Text(topSub,
            style: AppTextStyles.ptdRegular(16)
                .copyWith(color: isTopActive ? activeColor : inactiveColor)),

        const SizedBox(height: 12),

        /// _SbtiBar 내부의 게이지 부분 수정
        Container(
          height: barHeight,
          width: barWidth,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(barWidth / 2),
          ),
          child: Stack(
            // 💡 Alignment를 중앙으로 잡거나, 조건에 따라 위/아래로 정렬합니다.
            alignment:
                isTopActive ? Alignment.topCenter : Alignment.bottomCenter,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                // 💡 전체 높이의 85%까지만 차오르도록 계산
                height: barHeight * displayValue,
                width: barWidth,
                decoration: BoxDecoration(
                  color: AppColors.primaryMain,
                  borderRadius: BorderRadius.circular(barWidth / 2),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // 아래쪽 라벨 (점수가 낮으면 검은색, 높으면 회색 - 서로 반대)
        Text(bottomLabel,
            style: AppTextStyles.ptdBold(20).copyWith(
                color: !isTopActive ? activeColor : inactiveColor,
                height: 1.0)),
        Text(bottomSub,
            style: AppTextStyles.ptdRegular(16)
                .copyWith(color: !isTopActive ? activeColor : inactiveColor)),
      ],
    );
  }
}
