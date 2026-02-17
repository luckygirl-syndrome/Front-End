import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/router/app_router.dart';
import 'package:ttobaba/main.dart'; // MyApp 가져오기

void main() {
  // 홈 화면부터 시작하는 테스트 (로그인 건너뛰기)
  runApp(
    ProviderScope(
      child: MyApp(
        router: createAppRouter(initialLocation: '/home'),
      ),
    ),
  );
}
