import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttobaba/features/home/screens/home_screen.dart';
// 👈 HomeProvider의 실제 경로에 맞춰 임포트하십시오. [cite: 2026-01-02]
// import 'package:ttobaba/core/providers/home_provider.dart'; 

void main() {
  runApp(
    // 1. 전산학적 상태 관리를 위해 Provider로 감쌉니다. [cite: 2026-01-02]
    ChangeNotifierProvider(
      create: (_) => HomeProvider(), // 탭 인덱스 관리 객체 [cite: 2026-02-13]
      child: const TestApp(),
    ),
  );
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ttobaba Home Test',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      // 2. 개별 위젯이 아닌 HomeScreen 전체를 로드합니다. [cite: 2026-02-13]
      home: const HomeScreen(), 
    );
  }
}

// 👈 HomeProvider가 아직 정의되지 않았다면 임시로 아래 클래스를 사용하십시오. [cite: 2026-01-02]
class HomeProvider extends ChangeNotifier {
  int _currentTabIndex = 2; // 세 번째 탭(영수증)을 기본으로 설정 [cite: 2026-02-13]
  int get currentTabIndex => _currentTabIndex;

  void setTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}