import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductRepository(dio);
});

class ProductRepository {
  final Dio _dio;

  ProductRepository(this._dio);

  /// 상품 URL을 파싱하여 상품 특징(심리 축 포함)을 반환합니다.
  Future<Map<String, dynamic>> parseProductUrl(String url) async {
    try {
      final response = await _dio.get(
        '/api/products/parse',
        queryParameters: {'url': url},
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
