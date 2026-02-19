import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/profile_service.dart';
import '../models/profile_model.dart';
import '../models/persona_model.dart';
import '../../../core/network/dio_provider.dart'; // 아까 만든 공통 Dio
// ... 상단 import 생략

// 1. 서비스 공급자 (Dio 주입)
final profileServiceProvider = Provider<ProfileService>((ref) {
  final dio = ref.watch(dioProvider);
  return ProfileService(dio);
});

// 2. GET: 프로필 데이터 공급자 (마이페이지용)
final profileDataProvider = FutureProvider<ProfileModel>((ref) async {
  final service = ref.watch(profileServiceProvider);
  return await service.getProfile();
});

// 3. GET: 페르소나 데이터 공급자 (마이페이지용)
final personaDataProvider = FutureProvider<PersonaModel>((ref) async {
  final service = ref.watch(profileServiceProvider);
  return await service.getPersona();
});

// 4. State & Notifier (수정 화면용)
class ProfileState {
  final String nickname;
  final int selectedImageIndex;

  ProfileState({this.nickname = '', this.selectedImageIndex = 6});

  ProfileState copyWith({String? nickname, int? selectedImageIndex}) {
    return ProfileState(
      nickname: nickname ?? this.nickname,
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileService _service;
  final Ref _ref;

  // 💡 생성자에서 서비스와 ref를 받도록 유지
  ProfileNotifier(this._service, this._ref) : super(ProfileState()) {
    // 💡 [최고의 코드 팁] 초기값 설정
    // 수정 화면 진입 시 마이페이지의 데이터를 초기값으로 세팅하고 싶다면 아래 주석 해제
    // final currentData = _ref.read(profileDataProvider).value;
    // if (currentData != null) {
    //   state = ProfileState(nickname: currentData.name, selectedImageIndex: currentData.profileImageIndex);
    // }
  }

  void setNickname(String val) => state = state.copyWith(nickname: val);
  void selectImage(int index) => state = state.copyWith(selectedImageIndex: index);

  // ✅ PATCH: 프로필 저장 및 마이페이지 새로고침 통합
  Future<void> saveProfile() async {
    try {
      await _service.updateProfile(
        name: state.nickname,
        imageIndex: state.selectedImageIndex,
      );

      // 💡 데이터 무효화: 마이페이지(GET) 프로바이더들을 새로고침함
      _ref.invalidate(profileDataProvider);
      _ref.invalidate(personaDataProvider);
    } catch (e) {
      rethrow; 
    }
  }

  bool get isValid => state.nickname.isNotEmpty;
}

// 5. ✅ Provider 선언부 수정 (가장 중요!)
final profileProvider = StateNotifierProvider.autoDispose<ProfileNotifier, ProfileState>((ref) {
  // 💡 여기서 필요한 의존성들을 주입해줍니다.
  final service = ref.watch(profileServiceProvider);
  return ProfileNotifier(service, ref); // 생성자에 전달
});