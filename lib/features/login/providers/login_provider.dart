import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/login/models/auth_model.dart';
import 'package:ttobaba/features/login/repositories/auth_repository.dart';

class LoginState {
  final String email;
  final String password;
  final bool isLoading;

  LoginState({this.email = '', this.password = '', this.isLoading = false});

  LoginState copyWith({String? email, String? password, bool? isLoading}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  LoginNotifier(this.ref) : super(LoginState());

  void updateEmail(String val) => state = state.copyWith(email: val);
  void updatePassword(String val) => state = state.copyWith(password: val);

  Future<bool> login() async {
    // 입력값 검증 (간단 예시)
    if (state.email.isEmpty || state.password.isEmpty) return false;

    state = state.copyWith(isLoading: true);

    try {
      final repository = ref.read(authRepositoryProvider);
      final storage = ref.read(secureStorageProvider);

      final token = await repository.login(LoginRequest(
        email: state.email,
        password: state.password,
      ));

      // 토큰 저장
      await storage.write(key: 'access_token', value: token);

      state = state.copyWith(isLoading: false);
      return true; // 로그인 성공
    } catch (e) {
      debugPrint("Login Error: $e");
      state = state.copyWith(isLoading: false);
      return false; // 로그인 실패
    }
  }
}

// 4. 프로바이더 선언 시 ref 전달
final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});
