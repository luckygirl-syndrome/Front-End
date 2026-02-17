import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 홈 상태 모델 (상단 탭 인덱스 등 관리)
class HomeState {
  final int currentTopTabIndex;
  final int currentNavIndex;

  HomeState({
    this.currentTopTabIndex = 0,
    this.currentNavIndex = 1, // 홈이 1번이라고 가정 (0:채팅, 1:홈, 2:??)
  });

  HomeState copyWith({
    int? currentTopTabIndex,
    int? currentNavIndex,
  }) {
    return HomeState(
      currentTopTabIndex: currentTopTabIndex ?? this.currentTopTabIndex,
      currentNavIndex: currentNavIndex ?? this.currentNavIndex,
    );
  }
}

// 2. 홈 Notifier
class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  void setTopTabIndex(int index) {
    state = state.copyWith(currentTopTabIndex: index);
  }

  void setNavIndex(int index) {
    state = state.copyWith(currentNavIndex: index);
  }
}

// 3. Provider 선언
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
