import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/home/repositories/home_repository.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/home/models/dashboard_model.dart';
import 'package:ttobaba/features/my_page/providers/user_provider.dart';

part 'dashboard_provider.g.dart';

@riverpod
class Dashboard extends _$Dashboard {
  @override
  FutureOr<HomeDashboardData?> build() async {
    return _fetchDashboard();
  }

  Future<HomeDashboardData?> _fetchDashboard() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.read(key: 'access_token');
    if (token == null) {
      debugPrint("❌ [Dashboard] No token found");
      return null;
    }

    try {
      final repository = ref.read(homeRepositoryProvider);
      final response = await repository.getHomeDashboard();

      debugPrint("✅ [Dashboard] Response: $response");
      // API response structure: { "id": 1, "data": { ... } }
      return HomeDashboardData.fromJson(response['data']);
    } catch (e) {
      debugPrint(
        "❌ [Dashboard] API Error: $e. Falling back to default values.",
      );

      // 서버 에러(500) 또는 데이터 부재 시 기본값(0원, 0건) 반환
      final user = ref.read(userProvider).value;
      return HomeDashboardData(
        userName: user?.nickname ?? '또바바',
        savedAmount: 0,
        recentChatCount: 0,
        totalChatCount: 0,
      );
    }
  }
}
