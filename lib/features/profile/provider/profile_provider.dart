import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileState {
  final String nickname;
  final int selectedImageIndex;

  ProfileState(
      {this.nickname = '', this.selectedImageIndex = 6}); // 시안상 7번째 캐릭터 선택됨

  ProfileState copyWith({String? nickname, int? selectedImageIndex}) {
    return ProfileState(
      nickname: nickname ?? this.nickname,
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState());

  void setNickname(String val) => state = state.copyWith(nickname: val);
  void selectImage(int index) =>
      state = state.copyWith(selectedImageIndex: index);

        // my_page_provider.dart 내부
  void updateImage(int newImageIndex) {
    state = state.copyWith(
      selectedImageIndex: newImageIndex,
    );
    // 💡 여기서 나중에 서버 PUT 통신을 하면 됩니다! [cite: 2026-02-17]
  }

  void updateNickname(String newNickname) {
    state = state.copyWith(
      nickname: newNickname,
    );
    // 💡 여기서 나중에 서버 PUT 통신을 하면 됩니다! [cite: 2026-02-17]
  }

  bool get isValid => state.nickname.isNotEmpty;
}

// ✅ 수정 (autoDispose 추가)
final profileProvider = StateNotifierProvider.autoDispose<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier();
});