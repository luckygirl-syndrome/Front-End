import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ttobaba/core/theme/app_colors.dart';

class AppTopbar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Modifier.width(390.dp) -> Fill 너비 반영
      height: 48, // Modifier.height(47.99961.dp) 반영
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Modifier.padding 반영
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 양 끝으로 배치
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 왼쪽: 로고 이미지
          SvgPicture.asset(
            'assets/images/logo.svg', // 파일 확장자 변경 (.svg)
            height: 24,               // 높이 유지
            fit: BoxFit.contain,      // fit 유지
            // 주의: SvgPicture.asset은 Image.asset과 동일한 방식의 errorBuilder를 지원하지 않습니다.
            // SVG 파일이 자산(assets)에 확실히 포함되어 있는지 확인해주세요.
          ),

          // 오른쪽: 알림 아이콘
          const Icon(
            Icons.notifications_none_outlined,
            color: AppColors.black,
            size: 24,
          ),
        ],
      ),
    );
  }

  // Scaffold의 appBar에 넣기 위해 필요한 설정
  @override
  Size get preferredSize => const Size.fromHeight(48);
}