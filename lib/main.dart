import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_colors.dart';

import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔐 개발 helper: 앱 시작 시 기존 토큰을 삭제할지 선택 가능
  // 기본값: false (토큰을 지우지 않음). 필요할 때만 아래 플래그로 true로 실행하세요:
  // flutter run --dart-define=CLEAR_TOKEN_ON_START=true
  const bool kClearTokenOnStart = bool.fromEnvironment(
    'CLEAR_TOKEN_ON_START',
    defaultValue: false,
  );
  const storage = FlutterSecureStorage();
  // Only clear token in debug builds when explicitly requested.
  if (kDebugMode && kClearTokenOnStart) {
    await storage.delete(key: 'access_token');
  }

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
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryMain,
          surface: AppColors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
      ),
      routerConfig: router ?? ref.watch(appRouterStateProvider),
      builder: (context, child) {
        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            color: AppColors.white,
            child: child,
          ),
        );
      },
    );
  }
}
