import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/my_page/models/chugume_model.dart';
import 'package:ttobaba/features/my_page/models/shop_model.dart';
import 'package:ttobaba/features/my_page/models/user_model.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UserRepository(dio);
});

class UserRepository {
  final Dio _dio;

  UserRepository(this._dio);

  Future<UserProfile> getProfile() async {
    try {
      final response = await _dio.get('/api/profile');
      if (response.statusCode != null &&
          (response.statusCode! < 200 || response.statusCode! >= 300)) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
      final data = response.data;
      if (data is! Map<String, dynamic>) throw Exception('Invalid profile response');
      return UserProfile.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfile(ProfileUpdateRequest request) async {
    try {
      await _dio.patch(
        '/api/setting/profile',
        data: request.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  // ── Favorite Shops ──

  Future<List<ShopName>> getFavoriteShops() async {
    try {
      final response = await _dio.get('/api/profile/shop');
      final data = response.data;
      if (data is Map<String, dynamic> && data['favorite_shops'] != null) {
        return (data['favorite_shops'] as List)
            .map((e) => ShopName.values.firstWhere(
                  (s) => s.label == e,
                  orElse: () => ShopName.musinsa,
                ))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFavoriteShops(UserShopsUpdate request) async {
    try {
      await _dio.post(
        '/api/profile/shop',
        data: request.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  // ── Chugume (추구미) ──

  Future<ChugumeType?> getChugume() async {
    try {
      final response = await _dio.get('/api/profile/chugume');
      final data = response.data;
      if (data is Map<String, dynamic> && data['chugume_type'] != null) {
        return ChugumeType.values.firstWhere(
          (c) => c.label == data['chugume_type'],
          orElse: () => ChugumeType.morigirl,
        );
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateChugume(ChugumeUpdate request) async {
    try {
      await _dio.post(
        '/api/profile/chugume',
        data: request.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  // ── Closet Stats ──

  Future<ClosetStats> getClosetStats() async {
    try {
      final response = await _dio.get('/api/profile/closet');
      return ClosetStats.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
