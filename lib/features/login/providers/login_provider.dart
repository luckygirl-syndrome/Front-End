// lib/features/auth/providers/login_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final Ref ref; // 1. Ref 추가

  LoginNotifier(this.ref) : super(LoginState());

  void updateEmail(String val) => state = state.copyWith(email: val);
  void updatePassword(String val) => state = state.copyWith(password: val);

  Future<bool> login() async {
    // 입력값 검증 (간단 예시)
    if (state.email.isEmpty || state.password.isEmpty) return false;

    state = state.copyWith(isLoading: true);

    try {
      // TODO: 실제 API 서버 통신 로직이 들어갈 자리
      // final response = await ref.read(authRepositoryProvider).signIn(state.email, state.password);

      state = state.copyWith(isLoading: false);
      return true; // 로그인 성공
    } catch (e) {
      state = state.copyWith(isLoading: false);
      return false; // 로그인 실패
    }
  }
}

// 4. 프로바이더 선언 시 ref 전달
final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});