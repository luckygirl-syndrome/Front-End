import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../sbti/providers/persona_provider.dart';
import '../../sbti/models/persona_model.dart';

class SbtiResultCard extends ConsumerWidget {
  // 💡 ConsumerWidget으로 변경
  const SbtiResultCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💡 실제 백엔드 Persona 상태를 구독합니다.
    final personaAsync = ref.watch(personaStateProvider);
    final persona = personaAsync.value;

    // 🎨 각 축(Axis)의 비율 계산
    // 0.5가 중간값이며, 한쪽 유형이 강할수록 1.0 또는 0.0에 가까워집니다.
    double getRatio(String topType, String bottomType, AxisScore? axis) {
      if (axis == null) return 0.5; // 데이터가 없으면 중간

      // axis.score는 axis.result에 해당하는 값의 퍼센티지 (예: 80)
      if (axis.result == topType) {
        return axis.score / 100.0;
      } else if (axis.result == bottomType) {
        return (100 - axis.score) / 100.0;
      }
      return 0.5;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
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
              value: getRatio('D', 'N', persona?.dVsN)), // 💡 계산된 비율 전달
          _SbtiBar(
              topLabel: 'S',
              topSub: '사회 자극',
              bottomLabel: 'A',
              bottomSub: '미적 자극',
              value: getRatio('S', 'A', persona?.sVsA)), // 💡 계산된 비율 전달
          _SbtiBar(
              topLabel: 'M',
              topSub: '마이웨이',
              bottomLabel: 'T',
              bottomSub: '유행',
              value: getRatio('M', 'T', persona?.mVsT)), // 💡 계산된 비율 전달
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

    // 🎨 점수 상관없이 이긴 쪽이 50% 꽉 차게 설정
    final bool isTopActive = value >= 0.5;
    const double displayHeight = barHeight / 2; // 항상 딱 절반만 채움

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
            clipBehavior: Clip.none,
            children: [
              // 💡 비율에 따라 중앙에서 위(혹은 아래)로 자라나도록 Positioned 활용
              Positioned(
                left: 0,
                right: 0,
                bottom: isTopActive ? (barHeight / 2) : null,
                top: isTopActive ? null : (barHeight / 2),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: displayHeight,
                  decoration: BoxDecoration(
                    color: AppColors.primaryMain,
                    borderRadius: BorderRadius.circular(barWidth / 2),
                  ),
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
