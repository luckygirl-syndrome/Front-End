import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatRepository(dio);
});

class ChatRepository {
  final Dio _dio;

  ChatRepository(this._dio);

  Future<void> startChat(String productUrl) async {
    try {
      await _dio.post(
        '/api/chat/start',
        queryParameters: {'product_url': productUrl},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> finalizeSurvey({
    required int q1,
    required int q2,
    required int q3,
    required int qc,
  }) async {
    try {
      await _dio.post(
        '/api/chat/finalize-survey',
        data: {
          'q1': q1,
          'q2': q2,
          'q3': q3,
          'qc': qc,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getChatList() async {
    try {
      final response = await _dio.get('/api/chat/list');
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
