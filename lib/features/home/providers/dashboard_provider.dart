import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/home/repositories/home_repository.dart';

part 'dashboard_provider.g.dart';

@riverpod
class Dashboard extends _$Dashboard {
  @override
  FutureOr<Map<String, dynamic>> build() async {
    return _fetchDashboard();
  }

  Future<Map<String, dynamic>> _fetchDashboard() async {
    final repository = ref.read(homeRepositoryProvider);
    return await repository.getHomeDashboard();
  }
}
