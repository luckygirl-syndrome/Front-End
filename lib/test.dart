import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_text_styles.dart';
import 'core/widgets/app_navbar.dart';
import 'core/widgets/yet_decided_item.dart'; // 방금 만든 위젯 임포트

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // 그림자 확인을 위해 배경을 살짝 어둡게 설정
      ),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true, // Navbar를 지울 거라면 이 줄도 필요 없습니다.
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('리스트 아이템 테스트'),
      ),
      
      // 이제 화면 전체에 리스트만 나옵니다.
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) => const YetDecidedItem(),
      ),
      
      // 💡 이 부분을 지우거나 주석 처리하세요!
      // bottomNavigationBar: AppNavbar(...), 
    );
  }
}