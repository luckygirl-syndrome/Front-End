import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/login/models/auth_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
});

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<String> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '/api/auth/login',
        data: request.toJson(),
      );
      // Response is { "status": "success", "access_token": "...", "token_type": "bearer" }
      final data = response.data as Map<String, dynamic>;
      return data['access_token'] as String;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signup(SignupRequest request) async {
    try {
      final response = await _dio.post(
        '/api/auth/signup',
        data: request.toJson(),
      );
      // Response is { "status": "success", "user_id": ..., ... }
      // We return "success" or similar if needed, or just void.
      // But keeping String return type for compatibility.
      final data = response.data as Map<String, dynamic>;
      return data['status'] as String? ?? 'success';
    } catch (e) {
      rethrow;
    }
  }
}
