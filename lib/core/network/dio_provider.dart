import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ttobaba/core/auth/auth_provider.dart';

// Secure Storage Provider
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

// 1. 기본 Dio 설정 (BaseOptions)
final dioProvider = Provider<Dio>((ref) {
  final storage = ref.watch(secureStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: "http://18.118.233.127:8001", // AWS 백엔드
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
      // ✅ validateStatus를 설정해서 모든 상태코드(4xx, 5xx)를 response로 처리
      validateStatus: (status) {
        // null을 반환하면 Dio가 default validation을 사용 (200-299만 OK)
        // true를 반환하면 모든 상태코드를 OK로 처리
        return true;
      },
    ),
  );

  // 2. 인터셉터 추가 (로그, 에러 처리, 토큰 주입 등)
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // SecureStorage에서 토큰을 꺼내와 헤더에 주입
      final token = await storage.read(key: 'access_token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      debugPrint("🚀 [Token] ${token != null ? 'Present' : 'Missing'}");
      debugPrint("🚀 [REQ] ${options.method} ${options.path}");
      return handler.next(options);
    },
    onResponse: (response, handler) {
      debugPrint(
          "✅ [RES] ${response.statusCode} ${response.requestOptions.path}");
      return handler.next(response);
    },
    onError: (DioException e, handler) async {
      debugPrint("❌ [ERR] ${e.response?.statusCode} ${e.requestOptions.path}");

      if (e.response?.statusCode == 401) {
        // 401 인가 실패 시 토큰 삭제 후 온보딩(또는 로그인)으로 강제 이동
        await storage.delete(key: 'access_token');
        ref.read(authStateProvider.notifier).refresh();
      }

      debugPrint("❌ [ERR MSG] ${e.message}");
      debugPrint("❌ [ERR DATA] ${e.response?.data}");
      debugPrint("❌ [Full Exception] $e");
      return handler.next(e);
    },
  ));

  return dio;
});
