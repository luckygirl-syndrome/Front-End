import 'package:flutter_riverpod/flutter_riverpod.dart';
class SbtiState {
  final int currentIndex;
  final Map<String, int> scores;

  SbtiState({this.currentIndex = 0, required this.scores});

  SbtiState copyWith({int? currentIndex, Map<String, int>? scores}) {
    return SbtiState(
      currentIndex: currentIndex ?? this.currentIndex,
      scores: scores ?? this.scores,
    );
  }
}

class SbtiNotifier extends StateNotifier<SbtiState> {
  SbtiNotifier()
      : super(SbtiState(
            scores: {'D': 0, 'N': 0, 'S': 0, 'A': 0, 'M': 0, 'T': 0}));

  void selectOption(String type) {
    // 1. 기존 점수 복사 및 업데이트
    final newScores = Map<String, int>.from(state.scores);
    newScores[type] = (newScores[type] ?? 0) + 1;

    // 2. 상태 업데이트 (인덱스 증가 + 새로운 점수)
    state = state.copyWith(
      currentIndex: state.currentIndex + 1,
      scores: newScores,
    );
  }

  void previousPage() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  void nextPage() {}
}

final sbtiProvider =
    StateNotifierProvider<SbtiNotifier, SbtiState>((ref) => SbtiNotifier());
