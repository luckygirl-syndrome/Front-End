import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/chat/models/chat_model.dart';

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ChatRepository(dio);
});

class ChatRepository {
  final Dio _dio;

  ChatRepository(this._dio);

  Future<ChatReply> startChat(String productUrl) async {
    try {
      final response = await _dio.post(
        '/api/chat/start',
        queryParameters: {'product_url': productUrl},
      );
      _validateResponse(response);
      _logStartResponse(response.data);
      return ChatReply.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ChatReply> finalizeSurvey({
    required int userProductId,
    required int q1,
    required int q2,
    required int q3,
    required int qc,
  }) async {
    try {
      // 설문 제출 후 서버에서 분석 시작 등으로 응답이 10초 이상 걸릴 수 있음
      final response = await _dio.post(
        '/api/chat/finalize-survey/$userProductId',
        data: {'q1': q1, 'q2': q2, 'q3': q3, 'qc': qc},
        options: Options(receiveTimeout: const Duration(seconds: 60)),
      );
      _validateResponse(response);
      final reply = ChatReply.fromJson(response.data);
      _logFinalizeResponse(reply);
      return reply;
    } catch (e) {
      rethrow;
    }
  }

  Future<ChatListResponse> getChatList() async {
    try {
      final response = await _dio.get('/api/chat/list');
      _validateResponse(response);
      return ChatListResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<ChatRoomDetailResponse> getChatRoomDetail(int userProductId) async {
    try {
      final response = await _dio.get('/api/chat/room/$userProductId');
      _validateResponse(response);
      return ChatRoomDetailResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  /// 첫 리플라이 재생성 (분석 지연 시 백엔드가 새로 생성해 DB 갱신). updated면 유효한 첫 메시지 준비됨.
  Future<Map<String, dynamic>> refreshFirstReply(int userProductId) async {
    try {
      final response = await _dio.post(
        '/api/chat/room/$userProductId/refresh-first-reply',
        options: Options(receiveTimeout: const Duration(seconds: 30)),
      );
      _validateResponse(response);
      final data = response.data is Map<String, dynamic>
          ? response.data as Map<String, dynamic>
          : <String, dynamic>{};
      return {
        'updated': data['updated'] == true,
        'reply': data['reply'] as String?,
      };
    } catch (e) {
      return {'updated': false, 'reply': null};
    }
  }

  /// 1회만 호출, 404면 null (폴링 루프에서 사용)
  Future<ChatRoomDetailResponse?> getChatRoomDetailSingleTry(
      int userProductId) async {
    try {
      final response = await _dio.get('/api/chat/room/$userProductId');
      if (response.statusCode == 404) return null;
      _validateResponse(response);
      return ChatRoomDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  /// 404 시 null 반환 (채팅방 준비 폴링용)
  Future<ChatRoomDetailResponse?> getChatRoomDetailIfReady(
    int userProductId, {
    int maxRetries = 15,
    Duration interval = const Duration(seconds: 5),
  }) async {
    for (var i = 0; i < maxRetries; i++) {
      try {
        final response = await _dio.get('/api/chat/room/$userProductId');
        if (response.statusCode == 404) {
          // 아직 채팅방(분석 결과)이 준비되지 않은 상태
          if (i < maxRetries - 1) {
            await Future.delayed(interval);
            continue;
          }
          return null;
        }
        _validateResponse(response);
        return ChatRoomDetailResponse.fromJson(response.data);
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          if (i < maxRetries - 1) {
            await Future.delayed(interval);
            continue;
          }
          return null;
        }
        rethrow;
      }
    }
    return null;
  }

  Future<ChatReply?> exitChat(int userProductId) async {
    try {
      // exit 시 백엔드가 LLM에 [EXIT] 보내고 응답 대기하므로 타임아웃 완화
      final response = await _dio.post(
        '/api/chat/exit/$userProductId',
        options: Options(receiveTimeout: const Duration(seconds: 60)),
      );
      _validateResponse(response);
      try {
        return ChatReply.fromJson(response.data);
      } catch (_) {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// 구매 확정(true) 또는 구매 포기(false) 시 is_abandoned도 함께 전달해야 백엔드에서 status 반영됨
  Future<void> updateStatus(int userProductId, bool isPurchased) async {
    try {
      final response = await _dio.post(
        '/api/chat/after/purchase',
        data: {
          'user_product_id': userProductId,
          'is_purchased': isPurchased,
          'is_abandoned': !isPurchased,
        },
      );
      _validateResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ChatReply> sendMessage(int userProductId, String message) async {
    try {
      // LLM 응답이 10초 넘어갈 수 있으므로 receiveTimeout 완화 (2분)
      final response = await _dio.post(
        '/api/chat/$userProductId/messages/',
        data: {'message': message},
        options: Options(receiveTimeout: const Duration(seconds: 120)),
      );
      _validateResponse(response);
      return ChatReply.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> submitFeedback({
    required int userProductId,
    required String feedback,
    required double rating,
  }) async {
    try {
      final response = await _dio.post(
        '/api/chat/after/feedback',
        data: {
          'user_product_id': userProductId,
          'feedback_content': feedback,
          'rating': rating,
        },
      );
      _validateResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  void _validateResponse(Response response) {
    if (response.statusCode != null &&
        (response.statusCode! < 200 || response.statusCode! >= 300)) {
      debugPrint(
        "❌ [ChatRepository] Error Response (${response.statusCode}): ${response.data}",
      );
      throw Exception("Server Error ${response.statusCode}: ${response.data}");
    }
  }

  /// 터미널에 스웨거처럼 /api/chat/start 응답을 크게 출력 (크롤링·설문 항목 수신 확인)
  void _logStartResponse(dynamic data) {
    if (data is! Map<String, dynamic>) return;
    const line = '══════════════════════════════════════════════════════════';
    debugPrint(line);
    debugPrint('📦 [CHAT START] 스웨거와 동일한 응답 수신');
    debugPrint(line);
    debugPrint('  status: ${data['status']}');
    debugPrint('  user_product_id: ${data['user_product_id']}');
    debugPrint('  message: ${data['message']}');
    final survey = data['survey_config'];
    if (survey is Map) {
      debugPrint('  survey_config:');
      for (final e in survey.entries) {
        debugPrint('    ${e.key}: ${e.value}');
      }
    }
    debugPrint(line);
  }

  /// 터미널에 스웨거처럼 /api/chat/finalize-survey 응답(첫 리플라이)을 크게 출력
  void _logFinalizeResponse(ChatReply reply) {
    const line = '══════════════════════════════════════════════════════════';
    debugPrint(line);
    debugPrint('📦 [CHAT FINALIZE] 첫 리플라이 수신 (스웨거 Response body)');
    debugPrint(line);
    debugPrint('  user_product_id: ${reply.userProductId}');
    debugPrint('  is_exit: ${reply.isExit}');
    debugPrint('  final_score: ${reply.finalScore}');
    debugPrint('  reply:');
    final text = reply.reply ?? '(null)';
    for (final ln in text.split('\n')) {
      debugPrint('    $ln');
    }
    debugPrint(line);
  }
}
