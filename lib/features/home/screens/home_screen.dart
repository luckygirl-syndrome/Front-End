import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/features/home/providers/home_provider.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/widgets/app_topbar.dart';
import 'package:ttobaba/core/widgets/app_navbar.dart';
import 'package:ttobaba/features/home/widgets/common/home_tabbar.dart';
import 'package:ttobaba/features/home/widgets/ttobaba/home_ttobaba_section.dart';
import 'package:ttobaba/features/home/widgets/decision/home_decision_section.dart';
import 'package:ttobaba/features/home/widgets/nobuy_receipt/simple_nobuy_receipt_section.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // 화면 진입 시 상단 탭을 '또바와 진대'(0)로 초기화
    // postFrameCallback을 사용하여 빌드 이후 실행 보장
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).setTopTabIndex(0);
      ref.read(homeProvider.notifier).setNavIndex(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);
    final _currentTopTabIndex = homeState.currentTopTabIndex;

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
                ref.read(homeProvider.notifier).setTopTabIndex(index);
              },
            ),

            // 2. 가변 영역: Expanded를 써야 남은 공간을 다 차지하며 내용이 보입니다. [cite: 2026-02-13]
            Expanded(
              child: _buildTabContent(_currentTopTabIndex),
            ),
          ],
        ),
      ),
      // 3. 네비게이션 바: body와 별개로 최하단에 명백히 고정됩니다. [cite: 2026-02-13]
      bottomNavigationBar: AppNavbar(
        currentIndex: 1, // 홈 화면에서는 항상 Home(1) 활성화
        onTap: (index) {
          if (index == 0) {
            context.push('/chat_list');
          } else if (index == 2) {
            context.push('/my_page');
          }
        },
      ),
    );
  }

  Widget _buildTabContent(int currentTopTabIndex) {
    switch (currentTopTabIndex) {
      case 0:
        return const HomeTtobabaSection(showReviewWidget: false);
      case 1:
        return const HomeDecisionSection();
      case 2:
        return const SimpleNobuyReceiptSection();
      default:
        return const HomeTtobabaSection(showReviewWidget: false);
    }
  }
}
