import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/features/my_page/models/chugume_model.dart';
import 'package:ttobaba/features/my_page/models/shop_model.dart';
import 'package:ttobaba/features/my_page/providers/chugume_provider.dart';
import 'package:ttobaba/features/my_page/providers/shop_provider.dart';

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
  // [추가] Ref 주입
  final Ref ref;

  InitialQuestionNotifier(this.ref) : super(InitialQuestionState());

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
  Future<void> handleNext({required VoidCallback onAllFinished}) async {
    if (state.currentIndex < state.questions.length - 1) {
      nextPage();
    } else {
      // 마지막 페이지에서 다음 버튼 누르면 완료 처리 및 데이터 전송
      await _submitResults();
      state = state.copyWith(isFinished: true);
      onAllFinished(); // 💡 내비게이션은 UI 레이어에서 처리
    }
  }

  Future<void> _submitResults() async {
    try {
      // 1. Favorite Shops 전송
      // 문자열 리스트를 ShopName enum 리스트로 변환
      final shops = state.selectedMalls.map((label) {
        return ShopName.values.firstWhere(
          (s) => s.label == label,
          orElse: () => ShopName.musinsa, // Default fallback
        );
      }).toList();

      if (shops.isNotEmpty) {
        await ref.read(favoriteShopsProvider.notifier).updateShops(shops);
      }

      // 2. Chugume 전송
      // 사용자가 입력한 텍스트를 ChugumeType으로 매핑 (정확히 일치해야 함)
      // 만약 입력이 자유 텍스트라면 API 스펙(ENUM)과 맞지 않을 수 있음.
      // 일단 ENUM에 있는 값만 처리하도록 시도.
      final chugumeInput = state.chugumiText.trim();
      final chugumeType = ChugumeType.values.firstWhere(
        (t) => t.label == chugumeInput,
        orElse: () => ChugumeType.morigirl, // Default or handle error
      );

      // 텍스트가 비어있지 않거나 매칭되는 경우만 전송?
      // 여기서는 기본적으로 Default로 매핑해서 전송하거나, 매칭 안되면 스킵하는 정책 필요.
      // 사용자 입력이 ENUM과 다르면 전송 불가.
      // TODO: 추구미 입력 방식이 텍스트 필드라면 validate 필요.
      if (chugumeInput.isNotEmpty) {
        await ref.read(chugumeProvider.notifier).updateChugume(chugumeType);
      }
    } catch (e) {
      debugPrint("❌ [InitialQuestion] Submit Error: $e");
      // UI에 에러를 알리거나 조용히 실패 처리
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

  // 완료 화면에서 다시 질문으로 돌아오기
  void returnToQuestion() {
    state = state.copyWith(
      isFinished: false,
      currentIndex: state.questions.length - 1, // 마지막 질문으로 이동
    );
  }

  // 리셋 (필요시)
  void reset() => state = InitialQuestionState();
}

// 프로바이더 선언
final initialQuestionProvider =
    StateNotifierProvider<InitialQuestionNotifier, InitialQuestionState>((ref) {
  return InitialQuestionNotifier(ref);
});
