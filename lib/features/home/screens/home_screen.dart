import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/widgets/app_topbar.dart';
import 'package:ttobaba/core/widgets/app_navbar.dart';
import 'package:ttobaba/features/home/widgets/home_tabbar.dart';
import 'package:ttobaba/features/home/widgets/home_main_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 1; // 홈 탭 기본 선택
  int _currentTopTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // 1. 본문 영역: Column 내부에서 위젯들을 순서대로 쌓습니다. [cite: 2026-02-13]
      body: SafeArea(
        child: Column(
          children: [
            const AppTopbar(), // 최상단 로고바 [cite: 2026-02-13]
            HomeTabBar(
              currentIndex: _currentTopTabIndex,
              onTabChanged: (index) {
                setState(() => _currentTopTabIndex = index);
              },
            ),
            
            // 2. 가변 영역: Expanded를 써야 남은 공간을 다 차지하며 내용이 보입니다. [cite: 2026-02-13]
            Expanded(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
      // 3. 네비게이션 바: body와 별개로 최하단에 명백히 고정됩니다. [cite: 2026-02-13]
      bottomNavigationBar: AppNavbar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() => _currentNavIndex = index);
        },
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_currentTopTabIndex) {
      case 0:
        return const HomeMainSection(); // "또바와 진대" [cite: 2026-02-13]
      case 1:
        return const Center(child: Text("결정했나요? 화면 (준비 중)")); 
      case 2:
        return const Center(child: Text("안 산 영수증 화면 (준비 중)"));
      default:
        return const HomeMainSection();
    }
  }
}