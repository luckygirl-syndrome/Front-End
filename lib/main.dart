import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart'; // 2. 위에서 만든 라우터 불러오기

import 'package:go_router/go_router.dart'; // import 추가

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  final GoRouter? router;

  const MyApp({super.key, this.router});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: '또바바',
      // 3. GoRouter 연결의 핵심!
      routerConfig: router ?? appRouter,
    );
  }
}
