import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupState {
  final int currentPage;
  final List<TextEditingController> controllers;
  // ⭐ 텍스트 변경을 감지하기 위한 트리거 (단순히 화면 갱신용)
  final String lastUpdated; 

  SignupState({
    required this.currentPage,
    required this.controllers,
    this.lastUpdated = '',
  });

  SignupState copyWith({int? currentPage, String? lastUpdated}) {
    return SignupState(
      currentPage: currentPage ?? this.currentPage,
      controllers: controllers,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier()
      : super(SignupState(
          currentPage: 0,
          controllers: List.generate(4, (_) => TextEditingController()),
        )) {
    // ⭐ 생성자에서 각 컨트롤러에 리스너를 달아줍니다.
    for (var controller in state.controllers) {
      controller.addListener(_onTextChanged);
    }
  }

  // 텍스트가 바뀔 때마다 상태를 업데이트해서 UI를 리빌드하게 만듭니다.
  void _onTextChanged() {
    state = state.copyWith(lastUpdated: DateTime.now().toString());
  }

  void setPage(int index) {
    state = state.copyWith(currentPage: index);
  }

  bool isGuideValid(int pageIndex, int guideIndex) {
    String text = state.controllers[pageIndex].text;

    if (pageIndex == 1) { // 이메일
      if (guideIndex == 0) return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text);
      if (guideIndex == 1) return text.length >= 5 && text.length <= 50;
    }
    if (pageIndex == 2) { // 비밀번호
      if (guideIndex == 0) return text.length >= 8 && text.length <= 16;
      if (guideIndex == 1) return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(text);
    }
    if (pageIndex == 3) { // 비밀번호 확인
      return text.isNotEmpty && text == state.controllers[2].text;
    }
    return false;
  }

  bool isPageValid(List<Map<String, dynamic>> pageData) {
    final int current = state.currentPage;
    final List<String> guides = List<String>.from(pageData[current]['guides'] ?? []);
    
    if (guides.isEmpty) return state.controllers[current].text.trim().isNotEmpty;
    
    return List.generate(guides.length, (i) => isGuideValid(current, i))
        .every((valid) => valid);
  }

  @override
  void dispose() {
    for (var c in state.controllers) {
      c.removeListener(_onTextChanged); // 리스너 해제
      c.dispose();
    }
    super.dispose();
  }
}

final signupProvider = StateNotifierProvider.autoDispose<SignupNotifier, SignupState>((ref) {
  return SignupNotifier();
});