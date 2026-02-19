import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// State는 순수하게 입력된 텍스트 값과 상태 정보만 들고있는게 좋음
class SignupState {
  final int currentPage;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isLoading;

  SignupState({
    this.currentPage = 0,
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isLoading = false,
  });

  // Getter를 통해 현재 페이지가 유효한지 notifier가 아닌 state가 판단하게 합니다.
  bool get isNameValid => name.trim().isNotEmpty;
  bool get isEmailValid =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  bool get isPasswordValid =>
      password.length >= 8 &&
      password.length <= 16 &&
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(password);
  bool get isConfirmValid =>
      confirmPassword.isNotEmpty && password == confirmPassword;

  SignupState copyWith({
    int? currentPage,
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isLoading,
  }) {
    return SignupState(
      currentPage: currentPage ?? this.currentPage,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SignupNotifier extends StateNotifier<SignupState> {
  final Ref ref; // 1. 통로(Ref) 확보!

  // PageController를 Notifier가 직접 관리
  final PageController pageController = PageController();

  SignupNotifier(this.ref) : super(SignupState());

  void updateName(String val) => state = state.copyWith(name: val);
  void updateEmail(String val) => state = state.copyWith(email: val);
  void updatePassword(String val) => state = state.copyWith(password: val);
  void updateConfirmPassword(String val) =>
      state = state.copyWith(confirmPassword: val);

  void setPage(int index) => state = state.copyWith(currentPage: index);

  // 현재 페이지 번호에 따라 유효성을 반환
  bool isCurrentPageValid() {
    switch (state.currentPage) {
      case 0:
        return state.isNameValid;
      case 1:
        return state.isEmailValid;
      case 2:
        return state.isPasswordValid;
      case 3:
        return state.isConfirmValid;
      default:
        return false;
    }
  }

  /// 특정 페이지의 특정 가이드가 유효한지 체크
  bool isGuideValid(int pageIndex, int guideIndex) {
    switch (pageIndex) {
      case 1: // 이메일 페이지
        if (guideIndex == 0) return state.isEmailValid; // 형식 체크
        if (guideIndex == 1)
          return state.email.length >= 8 && state.email.length <= 16; // 길이 체크
        return false;

      case 2: // 비밀번호 페이지
        // 0: 8~16자, 1: 영어/숫자 조합
        if (guideIndex == 0)
          return state.password.length >= 8 && state.password.length <= 16;
        if (guideIndex == 1)
          return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(state.password);
        return false;

      case 3: // 비밀번호 확인 페이지
        // 0: 동일한 비밀번호 입력
        if (guideIndex == 0) return state.isConfirmValid;
        return false;

      default:
        return true; // 가이드가 없는 페이지(이름 등)는 기본 true
    }
  }

  Future<void> completeSignup() async {
    state = state.copyWith(isLoading: true);

    try {
      // 2. 다른 프로바이더(예: Repository)에 접근해서 실제 서버에 데이터 전송
      // final authRepo = ref.read(authRepositoryProvider);
      // final result = await authRepo.signUp(state.name, state.email, state.password);

      // 3. 가입 성공 후, 유저 정보를 전역 유저 상태에 저장
      // ref.read(userProvider.notifier).setUser(result.user);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  // 3. 페이지 이동 (이제 여기서 모든 걸 판단)
  void next(VoidCallback onComplete) {
    if (isCurrentPageValid()) {
      if (state.currentPage < 3) {
        final nextStep = state.currentPage + 1;
        state = state.copyWith(currentPage: nextStep); // 상태 변경

        pageController.animateToPage(
          // 화면 이동
          nextStep,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        // 회원가입 완료 로직
        completeSignup().then((_) {
          onComplete();
        });
      }
    }
  }

  void back(VoidCallback onFirstPageBack) {
    if (state.currentPage > 0) {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // 💡 0페이지라면 인자로 받은 '로그인 뷰 이동' 콜백 실행
      onFirstPageBack();
    }
  }

  @override
  void dispose() {
    pageController.dispose(); // Notifier가 사라질 때 같이 정리
    super.dispose();
  }
}

// 4. 프로바이더 선언부에서 ref를 넘겨줌
final signupProvider =
    StateNotifierProvider.autoDispose<SignupNotifier, SignupState>((ref) {
  return SignupNotifier(ref);
});
