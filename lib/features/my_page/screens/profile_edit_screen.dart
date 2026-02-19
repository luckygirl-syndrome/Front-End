import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/widgets/app_backbar.dart';
import 'package:ttobaba/core/widgets/app_button.dart';
import 'package:ttobaba/core/widgets/app_text_field.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../provider/profile_provider.dart';
import '../widgets/profile_image_grid.dart';

class ProfileEditScreen extends ConsumerWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);
    // 1. 위젯 하단부나 적절한 위치에 버튼 배치
    final isImageSelected =
        state.selectedImageIndex != null; // 또는 초기값에 따라 != -1

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBackBar(
        title: '프로필 설정',
        onBackPressed: () => context.pop(),
        // AppBackBar가 아래처럼 bottom 인자를 받을 수 있도록 선언되어 있다면
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.lightGrey, // 마이페이지 디자인과 통일 [cite: 2026-02-16]
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이름을 바꿀래요?',
                style: AppTextStyles.ptdBold(20).copyWith(height: 1.0)),
            const SizedBox(height: 14),
            AppTextField(
              hint: '바꿀 이름을 입력해 주세요',
              onChanged: notifier.setNickname,
              //textStyle: AppTextStyles.ptdRegular(16),
            ),
            const SizedBox(height: 24),
            AppButton(
              text: '이거로 할래요',
              onPressed: (notifier.isValid)
                  ? () async {
                      // 💡 Screen에서는 딱 이 호출만 합니다.
                      await ref.read(profileProvider.notifier).saveProfile();
                    }
                  : null,
              textStyle: AppTextStyles.ptdBold(16),
              borderRadius: 4,
            ),
            const SizedBox(height: 80),
            Text('프사를 바꿀래요?', style: AppTextStyles.ptdBold(20)),
            const SizedBox(height: 16),
            ProfileImageGrid(), // 아래에서 정의할 그리드 위젯
            // ProfileEditScreen 내부의 AppButton 부분
            AppButton(
              text: '이거로 할래요',
              // 1. 색상 조건 추가: 선택되었을 때만 노란색(또는 primaryMain)으로!
              backgroundColor: isImageSelected
                  ? AppColors.primaryMain // 또는 노란색 변수명
                  : AppColors.paleGrey, // 비활성화 색상

              // 2. 텍스트 색상도 선택 여부에 따라 조절하면 더 예뻐요 (선택사항)
              textColor: isImageSelected ? Colors.white : Colors.grey,

              onPressed: (notifier.isValid)
                  ? () async {
                      // 💡 Screen에서는 딱 이 호출만 합니다.
                      await ref.read(profileProvider.notifier).saveProfile();
                    }
                  : null,
              textStyle: AppTextStyles.ptdBold(16),
              borderRadius: 4,
            )
          ],
        ),
      ),
    );
  }
}
