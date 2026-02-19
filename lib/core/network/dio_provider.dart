import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 기본 Dio 설정 (BaseOptions)
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://your-api-url.com/api",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      contentType: 'application/json',
    ),
  );

  // 2. 인터셉터 추가 (로그, 에러 처리, 토큰 주입 등)
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // 여기서 SecureStorage 등에서 토큰을 꺼내와 헤더에 넣는 로직을 추가할 수 있습니다.
      // options.headers['Authorization'] = 'Bearer $yourToken';
      print("🚀 [REQ] ${options.method} ${options.path}");
      return handler.next(options);
    },
    onResponse: (response, handler) {
      print("✅ [RES] ${response.statusCode}");
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      print("❌ [ERR] ${e.response?.statusCode}");
      return handler.next(e);
    },
  ));

  return dio;
});