import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifier, StateNotifierProvider;

class MyPageState {
  final String nickname;
  final int profileImageIndex;
  final int purchasedCount;
  final String purchasedAmount;
  final int abandonedCount;
  final String abandonedAmount;
  final bool isLoading;

  MyPageState({
    this.nickname = '유저님',
    this.profileImageIndex = 6,
    this.purchasedCount = 0,
    this.purchasedAmount = '0원',
    this.abandonedCount = 0,
    this.abandonedAmount = '0원',
    this.isLoading = false,
  });

  // 상태를 변경할 때 사용할 copyWith 메서드 [cite: 2026-02-17]
  MyPageState copyWith({
    String? nickname,
    int? profileImageIndex,
    int? purchasedCount,
    String? purchasedAmount,
    int? abandonedCount,
    String? abandonedAmount,
    bool? isLoading,
  }) {
    return MyPageState(
      nickname: nickname ?? this.nickname,
      profileImageIndex: profileImageIndex ?? this.profileImageIndex,
      purchasedCount: purchasedCount ?? this.purchasedCount,
      purchasedAmount: purchasedAmount ?? this.purchasedAmount,
      abandonedCount: abandonedCount ?? this.abandonedCount,
      abandonedAmount: abandonedAmount ?? this.abandonedAmount,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class MyPageNotifier extends StateNotifier<MyPageState> {
  MyPageNotifier() : super(MyPageState()) {
    // 초기 로딩 시 데이터 가져오기 [cite: 2026-02-17]
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(isLoading: true);
    
    // 임시로 1초 뒤 데이터가 불러와진 것처럼 설정 [cite: 2026-02-17]
    await Future.delayed(const Duration(seconds: 1));
    
    state = state.copyWith(
      nickname: '포근한 솜사탕',
      profileImageIndex: 6,
      purchasedCount: 18,
      purchasedAmount: '847,000원',
      abandonedCount: 7,
      abandonedAmount: '289,000원',
      isLoading: false,
    );
  }

  // 닉네임만 따로 업데이트하고 싶을 때 [cite: 2026-02-17]
  void updateNickname(String newName) {
    state = state.copyWith(nickname: newName);
  }
}

// Provider 선언 [cite: 2026-02-17]
final myPageProvider = StateNotifierProvider<MyPageNotifier, MyPageState>((ref) {
  return MyPageNotifier();
});