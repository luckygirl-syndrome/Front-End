import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/features/initial_question/provider/initial_question_provider.dart';
import 'package:ttobaba/features/initial_question/screens/initial_question_screen.dart';
import 'package:go_router/go_router.dart';

// Q2(추구미) 화면을 바로 보기 위한 테스트용 노티파이어
class TestInitialQuestionNotifier extends InitialQuestionNotifier {
  TestInitialQuestionNotifier() : super() {
    // 생성되자마자 Q2 (index 1) 상태로 설정
    state = InitialQuestionState(currentIndex: 1);
  }
}

void main() {
  runApp(
    ProviderScope(
      overrides: [
        // 기존 프로바이더를 테스트용 노티파이어로 덮어쓰기
        initialQuestionProvider
            .overrideWith((ref) => TestInitialQuestionNotifier()),
      ],
      child: const TestApp(),
    ),
  );
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GoRouter 설정 추가
    final GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const InitialQuestionScreen(),
        ),
        GoRoute(
          path: '/initial_question_start',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('도착! (initial_question_start)')),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'Pretendard',
        useMaterial3: true,
      ),
    );
  }
}
