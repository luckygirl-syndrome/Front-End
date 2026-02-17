import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/router/app_router.dart';
import 'package:ttobaba/main.dart'; // MyApp 가져오기

void main() {
  // 스플래시/로그인부터 시작하는 전체 흐름 테스트
  runApp(
    ProviderScope(
      child: MyApp(
        router: createAppRouter(initialLocation: '/login'),
      ),
    ),
  );
}
