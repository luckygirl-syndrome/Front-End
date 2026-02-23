import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRepository(dio);
});

class HomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  Future<Map<String, dynamic>> getHomeDashboard() async {
    try {
      final response = await _dio.get('/api/dashboard/home');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
