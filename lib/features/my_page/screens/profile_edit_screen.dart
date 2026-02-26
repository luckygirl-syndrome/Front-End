import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/widgets/app_backbar.dart';
import 'package:ttobaba/core/widgets/app_button.dart';
import 'package:ttobaba/core/widgets/app_text_field.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../widgets/profile_image_grid.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  ConsumerState<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  late TextEditingController _nicknameController;
  int _selectedImageIndex = 0; // 기본값

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();

    // 초기값 설정
    final user = ref.read(userProvider).value;
    if (user != null) {
      _nicknameController.text = user.nickname;
      // profileImg → index 변환
      if (user.profileImg != null) {
        final idx = ProfileImageGrid.profileImages.indexOf(user.profileImg!);
        if (idx >= 0) _selectedImageIndex = idx;
      }
    }
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  void _onSave() async {
    final nickname = _nicknameController.text.trim();
    if (nickname.isEmpty) return;

    // 선택된 이미지 경로
    final selectedImg = ProfileImageGrid.profileImages[_selectedImageIndex];

    try {
      await ref.read(userProvider.notifier).updateProfile(
            ProfileUpdateRequest(
              nickname: nickname,
              profileImg: selectedImg,
            ),
          );
      if (mounted) {
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('프로필 수정 실패: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBackBar(
        title: '프로필 설정',
        onBackPressed: () => context.pop(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.lightGrey,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
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
              controller: _nicknameController,
              onChanged: (val) => setState(() {}),
            ),
            const SizedBox(height: 24),
            AppButton(
              text: '이거로 할래요',
              onPressed: _nicknameController.text.isNotEmpty ? _onSave : null,
              textStyle: AppTextStyles.ptdBold(16),
              borderRadius: 4,
            ),
            const SizedBox(height: 80),
            Text('프사를 바꿀래요?', style: AppTextStyles.ptdBold(20)),
            const SizedBox(height: 16),
            ProfileImageGrid(
              selectedImageIndex: _selectedImageIndex,
              onImageSelected: (index) {
                setState(() {
                  _selectedImageIndex = index;
                });
              },
            ),
            const SizedBox(height: 24),
            AppButton(
              text: '이거로 할래요',
              backgroundColor: AppColors.primaryMain,
              textColor: AppColors.white,
              onPressed: _nicknameController.text.isNotEmpty ? _onSave : null,
              textStyle: AppTextStyles.ptdBold(16),
              borderRadius: 4,
            )
          ],
        ),
      ),
    );
  }
}
