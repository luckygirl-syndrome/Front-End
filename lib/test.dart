import 'package:flutter/material.dart';
import 'package:ttobaba/core/widgets/app_topbar.dart';
import 'package:ttobaba/core/theme/app_colors.dart'; // 👈 AppColors 임포트 필수

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TopbarCenterTestScreen(),
  ));
}

class TopbarCenterTestScreen extends StatelessWidget {
  const TopbarCenterTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색: DarkScale의 black 적용 [cite: 2026-02-13]
      backgroundColor: AppColors.black, 
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'AppTopbar 중앙 배치 테스트',
              style: TextStyle(
                color: AppColors.white, // DarkScale의 white 적용 [cite: 2026-02-13]
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            
            // 👈 실제 탑바 위젯
            const AppTopbar(), 
            
            const SizedBox(height: 10),
            const Text(
              '좌우 32px, 상하 12px 패딩 확인',
              style: TextStyle(
                color: AppColors.grey, // DarkScale의 grey 적용 [cite: 2026-02-13]
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}