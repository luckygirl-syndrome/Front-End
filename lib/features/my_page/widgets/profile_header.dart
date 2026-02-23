// --- Screen 파일 하단에 위치 ---

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../models/user_model.dart';
import '../widgets/profile_image_grid.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/core/auth/auth_provider.dart';

class ProfileHeader extends ConsumerWidget {
  final UserProfile profile; // 서버에서 가져온 이름, 이미지 인덱스
  final String? personaType; // 서버에서 가져온 페르소나 3자리 타입 (DAM, NAT 등)
  final bool isLoadingPersona;

  const ProfileHeader({
    required this.profile,
    this.personaType,
    this.isLoadingPersona = false,
    super.key,
  });

  String _getPersonaName(String? type) {
    if (isLoadingPersona) return '유형 분석 중...';
    switch (type) {
      case 'DAM':
        return '직관적 탐미가';
      case 'NAM':
        return '실리적 취향파';
      case 'NAT':
        return '합리적 동조자';
      case 'DSM':
        return '감각적 개척자';
      case 'DAT':
        return '트렌드 세터';
      case 'NSM':
        return '정보 하이커';
      case 'NST':
        return '스마트 가성비족';
      case 'DST':
        return '인싸 유망주';
      default:
        return type ?? '유형 분석 중...';
    }
  }

  /// 서버에서 받은 profileImg 경로를 검증하고, 유효한 아바타 경로를 반환
  String _resolveProfileImg(String? img) {
    if (img != null && ProfileImageGrid.profileImages.contains(img)) {
      return img;
    }
    // 기본값: 첫 번째 아바타
    return ProfileImageGrid.profileImages[0];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double avatarRadius = 50.0; // 캐릭터 크기

    return Container(
      width: double.infinity,
      color: AppColors.white, // 배경 전체 색상
      child: Column(
        children: [
          // 1. 배경 이미지와 캐릭터가 겹치는 영역
          Stack(
            alignment: Alignment.bottomCenter, // 👈 모든 자식을 하단 중앙으로!
            clipBehavior: Clip.none,
            children: [
              // 노란색 배경 이미지
              Image.asset(
                'assets/images/ui/profile_round.png',
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
                    color: AppColors.white,
                    // 👈 1. 테두리 설정 (사진에 딱 붙음)
                    border: Border.all(
                      color: AppColors.primaryMain,
                      width: 2,
                    ),
                  ),
                  // 👈 2. 클립 + 패딩으로 이미지가 동그라미 안에 여유 있게 들어오게
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        _resolveProfileImg(profile.profileImg),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // 2. 캐릭터가 튀어나온 만큼 여백을 주고 텍스트 시작
          const SizedBox(height: avatarRadius + 18),
          Text(
            _getPersonaName(personaType),
            style: AppTextStyles.ptdExtraBold(24).copyWith(height: 1.0),
          ),
          const SizedBox(height: 4),
          Text(profile.nickname, style: AppTextStyles.ptdRegular(16)),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
            children: [
              AppButton(
                text: '프로필 설정',
                fitContent: true, // 💡 내용물에 맞게 너비 조절
                textStyle: AppTextStyles.ptdBold(12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                borderRadius: 4.0,
                onPressed: () => {context.push('/profile_edit')},
              ),

              const SizedBox(width: 8),

              // 로그아웃 버튼 (AppButton 사용)
              AppButton(
                text: '로그아웃',
                fitContent: true,
                backgroundColor: AppColors.white,
                textColor: AppColors.black,
                borderColor: AppColors.black,
                borderWidth: 1,
                textStyle: AppTextStyles.ptdBold(12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                borderRadius: 4.0,
                onPressed: () async {
                  // 토큰 삭제
                  final storage = ref.read(secureStorageProvider);
                  await storage.delete(key: 'access_token');

                  // 인증 상태 새로고침 (AppRouter가 감지하여 리다이렉트)
                  ref.read(authStateProvider.notifier).refresh();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
