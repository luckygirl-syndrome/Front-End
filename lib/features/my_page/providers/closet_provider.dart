import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/my_page/models/user_model.dart';
import 'package:ttobaba/features/my_page/repositories/user_repository.dart';

part 'closet_provider.g.dart';

@riverpod
class ClosetStatsState extends _$ClosetStatsState {
  @override
  FutureOr<ClosetStats?> build() async {
    return _fetchStats();
  }

  Future<ClosetStats?> _fetchStats() async {
    try {
      final repository = ref.read(userRepositoryProvider);
      return await repository.getClosetStats();
    } catch (e) {
      return const ClosetStats(
        boughtCount: 0,
        boughtPrice: 0,
        droppedCount: 0,
        droppedPrice: 0,
      );
    }
  }
}
