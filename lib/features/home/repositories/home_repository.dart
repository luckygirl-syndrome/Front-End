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

      
      if (response.statusCode != 200) {
        debugPrint("⚠️  [HomeRepository] Non-200 Response: ${response.data}");
        throw Exception(
          "Dashboard API Error: ${response.data['detail'] ?? 'Unknown error'}",
        );
      }

      
      

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

  /// GET /api/dashboard/receipts — 안 산 영수증 목록 (구매 포기 status만)
  /// Response: { "status": "string", "data": [ { user_product_id, product_id, product_name, product_img, price, discount_rate } ] }
  Future<List<Map<String, dynamic>>> getUnboughtReceiptsList() async {
    try {
      final response = await _dio.get('/api/dashboard/receipts');
      final json = response.data as Map<String, dynamic>;
      final data = json['data'];
      if (data is! List) return [];
      return List<Map<String, dynamic>>.from(
        data.map((e) => e as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }

  /// GET /api/dashboard/receipts/{user_product_id} — 안 산 영수증 상세 (구매 포기만)
  /// Response: { "status": "string", "data": { user_product_id, mall_name, brand, product_name, product_img, price, discount_rate, saved_amount, completed_at, duration_days } }
  /// 422: Validation Error
  Future<Map<String, dynamic>> getReceiptDetail(int userProductId) async {
    try {
      final response =
          await _dio.get('/api/dashboard/receipts/$userProductId');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        final detail = e.response?.data;
        final msg = detail is Map && detail['detail'] != null
            ? detail['detail'].toString()
            : '해당 영수증을 찾을 수 없습니다.';
        throw Exception(msg);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
