import 'package:flutter/material.dart';
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
      debugPrint("📡 [HomeRepository] Requesting: GET /api/dashboard/home");
      final response = await _dio.get('/api/dashboard/home');

      // ✅ 상태 코드 확인
      debugPrint("📡 [HomeRepository] Status Code: ${response.statusCode}");

      if (response.statusCode != 200) {
        debugPrint("⚠️  [HomeRepository] Non-200 Response: ${response.data}");
        throw Exception(
          "Dashboard API Error: ${response.data['detail'] ?? 'Unknown error'}",
        );
      }

      debugPrint("📡 [HomeRepository] Full Response: ${response.data}");
      debugPrint(
        "📡 [HomeRepository] Response Type: ${response.data.runtimeType}",
      );

      // 응답이 List인 경우
      if (response.data is List) {
        debugPrint(
          "⚠️  Response is a List, not Map. First item: ${(response.data as List).isNotEmpty ? (response.data as List)[0] : 'empty'}",
        );
      }

      return response.data as Map<String, dynamic>;
    } catch (e) {
      debugPrint("📡 [HomeRepository] Error: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getConsideringList() async {
    try {
      final response = await _dio.get('/api/dashboard/considering');
      // Response structure: { "status": "...", "data": [...] }
      final json = response.data as Map<String, dynamic>;
      return List<Map<String, dynamic>>.from(json['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getUnboughtReceiptsList() async {
    try {
      final response = await _dio.get('/api/dashboard/receipts');
      // Response structure: { "status": "...", "data": [...] }
      final json = response.data as Map<String, dynamic>;
      return List<Map<String, dynamic>>.from(json['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getReceiptDetail(int userProductId) async {
    try {
      final response = await _dio.get('/api/dashboard/receipts/$userProductId');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
