// --- Screen 파일 하단에 위치 ---

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../provider/my_page_state.dart';

class ProfileHeader extends StatelessWidget {
  final MyPageState state;
  const ProfileHeader({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    const double avatarRadius = 50.0; // 캐릭터 크기

    return Container(
      width: double.infinity,
      color: Colors.white, // 배경 전체 색상
      child: Column(
        children: [
          // 1. 배경 이미지와 캐릭터가 겹치는 영역
          Stack(
            alignment: Alignment.bottomCenter, // 👈 모든 자식을 하단 중앙으로!
            clipBehavior: Clip.none,
            children: [
              // 노란색 배경 이미지
              Image.asset(
                'assets/images/profile_round.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),

              FractionalTranslation(
                translation: const Offset(0, 0.5),
                child: Container(
                  width: avatarRadius * 2, // 반지름의 2배로 크기 설정
                  height: avatarRadius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    // 👈 1. 테두리 설정 (사진에 딱 붙음)
                    border: Border.all(
                      color: AppColors.primaryMain,
                      width: 2,
                    ),
                    // 👈 2. 이미지를 BoxDecoration 안에 넣기
                    image: const DecorationImage(
                      image: AssetImage('assets/images/sbti_cat.png'),
                      fit: BoxFit.cover, // 사진이 원에 꽉 차도록 설정 [cite: 2026-02-16]
                    ),
                  ),
                ),
              ),
            ],
          ),
          // 2. 캐릭터가 튀어나온 만큼 여백을 주고 텍스트 시작
          const SizedBox(height: avatarRadius + 18),
          Text(
            state.nickname,
            style: AppTextStyles.ptdExtraBold(24).copyWith(height: 1.0),
          ),
          const SizedBox(height: 4),
          Text(state.nickname, style: AppTextStyles.ptdRegular(16)),
          const SizedBox(height: 18),

          AppButton(
            text: '프로필 설정',
            width: 70,
            textStyle: AppTextStyles.ptdBold(12),
            padding: const EdgeInsets.symmetric(vertical: 4),
            onPressed: () => {context.push('/profile_edit')},
          ),
        ],
      ),
    );
  }
}