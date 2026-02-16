import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 상태 클래스
class InitialQuestionState {
  final int currentIndex;
  final Set<String> selectedMalls; // 복수 선택용
  final String chugumiText; // 추구미 입력용
  final bool isFinished; // 모든 질문 완료 여부
  // [추가] 질문 리스트를 상태에 포함
  final List<Map<String, dynamic>> questions;

  // Getter를 만들어 UI 코드를 더 깔끔하게
  Map<String, dynamic> get currentQuestion => questions[currentIndex];

  bool get isLastPage => currentIndex == questions.length - 1;

  // 현재 질문의 타입 (choice 인지 input 인지)
  String get currentType => currentQuestion['type'] as String;

  // 현재 질문의 제목
  String get currentTitle => currentQuestion['q'] as String;

  // 현재 질문의 선택지들 (없을 수 있으므로 빈 리스트 처리)
  List<String> get currentOptions =>
      (currentQuestion['options'] as List<String>?) ?? [];

  InitialQuestionState({
    this.currentIndex = 0,
    this.selectedMalls = const {},
    this.chugumiText = '',
    this.isFinished = false,
    // [추가] 기본 질문 데이터 설정
    this.questions = const [
      {
        'q': '자주 이용하는\n쇼핑몰이 있나요?',
        'type': 'choice',
        'options': ['무신사', '에이블리', '지그재그'],
      },
      {
        'q': '본인의 추구미가 있나요?',
        'type': 'input',
      },
    ],
  });

  InitialQuestionState copyWith({
    int? currentIndex,
    Set<String>? selectedMalls,
    String? chugumiText,
    bool? isFinished,
    List<Map<String, dynamic>>? questions,
  }) {
    return InitialQuestionState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedMalls: selectedMalls ?? this.selectedMalls,
      chugumiText: chugumiText ?? this.chugumiText,
      isFinished: isFinished ?? this.isFinished,
      questions: questions ?? this.questions,
    );
  }
}

// 노티파이어
class InitialQuestionNotifier extends StateNotifier<InitialQuestionState> {
  InitialQuestionNotifier() : super(InitialQuestionState());

  // 쇼핑몰 토글 (복수 선택)
  void toggleMall(String mall) {
    final updatedMalls = Set<String>.from(state.selectedMalls);
    if (updatedMalls.contains(mall)) {
      updatedMalls.remove(mall);
    } else {
      updatedMalls.add(mall);
    }
    state = state.copyWith(selectedMalls: updatedMalls);
  }

  // 추구미 텍스트 업데이트
  void updateChugumi(String text) {
    state = state.copyWith(chugumiText: text);
  }

  void nextPage() {
    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    } else {
      state = state.copyWith(isFinished: true);
    }
  }

  void previousPage() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  /// [개선] 다음 버튼 클릭 시 로직 통합
  void handleNext({required VoidCallback onAllFinished}) {
    if (state.currentIndex < state.questions.length - 1) {
      nextPage();
    } else {
      state = state.copyWith(isFinished: true);
      onAllFinished(); // 💡 내비게이션은 UI 레이어에서 처리
    }
  }

  // initial_question_provider.dart 내부
  void handleBack({required VoidCallback onExit}) {
    if (state.currentIndex == 0) {
      onExit(); // 첫 페이지면 화면 이탈
    } else {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  // 리셋 (필요시)
  void reset() => state = InitialQuestionState();
}

// 프로바이더 선언
final initialQuestionProvider =
    StateNotifierProvider<InitialQuestionNotifier, InitialQuestionState>((ref) {
  return InitialQuestionNotifier();
});
