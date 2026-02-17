import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 피드백 상태 모델
class FeedbackState {
  final bool isReturned;
  final int currentIndex;
  final String? reason;
  final int? satisfactionScore;

  FeedbackState({
    this.isReturned = false,
    this.currentIndex = 0,
    this.reason,
    this.satisfactionScore,
  });

  FeedbackState copyWith({
    bool? isReturned,
    int? currentIndex,
    String? reason,
    int? satisfactionScore,
  }) {
    return FeedbackState(
      isReturned: isReturned ?? this.isReturned,
      currentIndex: currentIndex ?? this.currentIndex,
      reason: reason ?? this.reason,
      satisfactionScore: satisfactionScore ?? this.satisfactionScore,
    );
  }
}

// 2. 피드백 Notifier
class FeedbackNotifier extends StateNotifier<FeedbackState> {
  FeedbackNotifier() : super(FeedbackState());

  void setReturned(bool value) {
    state = state.copyWith(isReturned: value);
  }

  void setIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void nextStep() {
    state = state.copyWith(currentIndex: state.currentIndex + 1);
  }

  void previousStep() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }
}

// 3. Provider 선언
final feedbackProvider =
    StateNotifierProvider<FeedbackNotifier, FeedbackState>((ref) {
  return FeedbackNotifier();
});
