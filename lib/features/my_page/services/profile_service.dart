import 'package:dio/dio.dart';
import '../models/profile_model.dart';
import '../models/persona_model.dart';

class ProfileService {
  final Dio _dio;
  ProfileService(this._dio);

  // iOS: getMyPage()
  Future<ProfileModel> getProfile() async {
    try {
      final response = await _dio.get('/profile');
      return ProfileModel.fromJson(response.data);
    } catch (e) {
      // 💡 에러가 나면 '프로필 데이터 파싱 에러'를 던지는 대신 기본값을 반환합니다.
      print("❌ 프로필 로드 실패, 기본값으로 대체합니다: $e");
      return ProfileModel.defaultProfile();
    }
  }

  // iOS: getProfile()
  Future<PersonaModel> getPersona() async {
    try {
      final response = await _dio.get('/profile/persona');
      return PersonaModel.fromJson(response.data);
    } catch (e) {
      print("❌ 페르소나 로드 실패: $e");
      // 💡 에러 시 화면을 덮는 대신 기본 페르소나 정보를 반환합니다.
      return PersonaModel.defaultPersona();
    }
  }

  Future<void> updateProfile({required String name, required int imageIndex}) async {
  try {
    // iOS의 Moya PATCH 요청과 동일한 역할
    await _dio.patch('/profile', data: {
      'name': name,
      'profile_image_index': imageIndex,
    });
  } on DioException catch (e) {
    throw Exception("프로필 수정 실패: ${e.response?.statusCode}");
  }
}
}
