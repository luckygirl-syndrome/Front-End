import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/features/sbti/models/persona_model.dart';
import 'package:ttobaba/features/sbti/providers/persona_provider.dart';

class SbtiState {
  final int currentIndex;
  final List<String> answers; // 점수 맵 대신 답변 리스트 저장
  final bool isLoading;

  SbtiState({
    this.currentIndex = 0,
    this.answers = const [], // 초기값 빈 리스트
    this.isLoading = false,
  });

  SbtiState copyWith({
    int? currentIndex,
    List<String>? answers,
    bool? isLoading,
  }) {
    return SbtiState(
      currentIndex: currentIndex ?? this.currentIndex,
      answers: answers ?? this.answers,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SbtiNotifier extends StateNotifier<SbtiState> {
  final Ref ref;

  SbtiNotifier(this.ref) : super(SbtiState());

  void selectOption(String type) {
    debugPrint(
        "🚀 [SBTI] Selected Option: $type, Current Index: ${state.currentIndex}");

    List<String> newAnswers = List.from(state.answers);

    // 현재 인덱스에 답변이 이미 있다면 수정, 없다면 추가
    if (state.currentIndex < newAnswers.length) {
      newAnswers[state.currentIndex] = type;
    } else {
      newAnswers.add(type);
    }

    state = state.copyWith(
      answers: newAnswers,
      currentIndex: state.currentIndex + 1,
    );

    debugPrint(
        "🚀 [SBTI] Current Answers: $newAnswers, Next Index: ${state.currentIndex}");
  }

  void previousPage() {
    if (state.currentIndex > 0) {
      state = state.copyWith(currentIndex: state.currentIndex - 1);
    }
  }

  Future<void> submitPersona() async {
    state = state.copyWith(isLoading: true);

    try {
      debugPrint("🚀 [SBTI] Submitting Persona... Answers: ${state.answers}");

      // 답변 리스트를 기반으로 점수 계산
      final scores = {'D': 0, 'N': 0, 'S': 0, 'A': 0, 'M': 0, 'T': 0};
      for (var answer in state.answers) {
        if (scores.containsKey(answer)) {
          scores[answer] = (scores[answer] ?? 0) + 1;
        }
      }

      debugPrint("🚀 [SBTI] Calculated Scores: $scores");

      // Axis 1: D vs N
      final dCount = scores['D'] ?? 0;
      final nCount = scores['N'] ?? 0;
      final dVsN = _createAxis('D', 'N', dCount, nCount);

      // Axis 2: S vs A
      final sCount = scores['S'] ?? 0;
      final aCount = scores['A'] ?? 0;
      final sVsA = _createAxis('S', 'A', sCount, aCount);

      // Axis 3: M vs T
      final mCount = scores['M'] ?? 0;
      final tCount = scores['T'] ?? 0;
      final mVsT = _createAxis('M', 'T', mCount, tCount);

      final personaType = "${dVsN.result}${sVsA.result}${mVsT.result}";

      final persona = Persona(
        personaType: personaType,
        dVsN: dVsN,
        sVsA: sVsA,
        mVsT: mVsT,
        description: "당신은 $personaType 유형입니다.",
      );

      debugPrint("🚀 [SBTI] Generated Persona: ${persona.toJson()}");

      await ref.read(personaStateProvider.notifier).updatePersona(persona);
    } catch (e) {
      debugPrint("Submit Persona Error: $e");
      rethrow;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  AxisScore _createAxis(String type1, String type2, int count1, int count2) {
    final total = count1 + count2;
    final result = count1 >= count2 ? type1 : type2;
    // Score 계산: 승자의 비율 (0~100)
    // 예: 3 vs 2 -> total 5. 승자(3) -> 60% -> score 60
    final score =
        total > 0 ? ((count1 >= count2 ? count1 : count2) * 100 ~/ total) : 0;

    return AxisScore(
      result: result,
      score: score,
    );
  }
}

final sbtiProvider =
    StateNotifierProvider<SbtiNotifier, SbtiState>((ref) => SbtiNotifier(ref));
