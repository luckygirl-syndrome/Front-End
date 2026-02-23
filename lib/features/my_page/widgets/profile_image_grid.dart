import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ProfileImageGrid extends StatelessWidget {
  final int selectedImageIndex;
  final Function(int) onImageSelected;

  /// 12개 프로필 아바타 이미지 경로 (공유용 static)
  static const List<String> profileImages = [
    'assets/images/avatars/image 197.png',
    'assets/images/avatars/image 197-1.png',
    'assets/images/avatars/image 198.png',
    'assets/images/avatars/image 198-1.png',
    'assets/images/avatars/image 199.png',
    'assets/images/avatars/image 199-1.png',
    'assets/images/avatars/image 200.png',
    'assets/images/avatars/image 200-1.png',
    'assets/images/avatars/image 201.png',
    'assets/images/avatars/image 201-1.png',
    'assets/images/avatars/image 202.png',
    'assets/images/avatars/image 4.png',
  ];

  const ProfileImageGrid({
    required this.selectedImageIndex,
    required this.onImageSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      // 2. 리스트의 실제 길이에 맞춥니다.
      itemCount: profileImages.length,
      itemBuilder: (context, index) {
        final isSelected = selectedImageIndex == index;
        final imagePath = profileImages[index]; // 현재 순서의 이미지 경로

        return GestureDetector(
          onTap: () => onImageSelected(index),
          child: Container(
            clipBehavior: Clip.antiAlias, // 이미지가 테두리를 넘어가지 않게 깎아줌
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              // 💡 그림자 설정 추가
              boxShadow: [
                BoxShadow(
                  color: AppColors.black
                      .withValues(alpha: 0.15), // 아주 연한 검은색 (0.05 정도가 적당)
                  spreadRadius: 1, // 그림자가 퍼지는 범위
                  blurRadius: 8, // 그림자의 부드러운 정도
                  offset: const Offset(0, 2), // 그림자 위치 (아래로 2만큼)
                ),
                // 2. 💡 선택 시 노란색 테두리 그림자 (Glow 효과)
                if (isSelected)
                  BoxShadow(
                    color:
                        AppColors.primaryMain.withValues(alpha: 0.4), // 노란색 광채
                    spreadRadius: 2, // 테두리 밖으로 퍼지는 정도
                    blurRadius: 10, // 부드럽게 퍼지는 정도
                    offset: const Offset(0, 0), // 사방으로 퍼지게 0으로 설정
                  ),
              ],
              border: Border.all(
                color: isSelected ? AppColors.primaryMain : Colors.transparent,
                width: 4,
              ),
            ),
            // 3. Icon 대신 실제 Image.asset을 넣습니다.
            child: Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 12 / 390, // 화면 비율 패딩
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person),
              ),
            ),
          ),
        );
      },
    );
  }
}
