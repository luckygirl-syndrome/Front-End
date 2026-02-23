import 'package:flutter/foundation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/my_page/models/chugume_model.dart';
import 'package:ttobaba/features/my_page/repositories/user_repository.dart';

part 'chugume_provider.g.dart';

@riverpod
class Chugume extends _$Chugume {
  @override
  FutureOr<ChugumeType?> build() async {
    return _fetchChugume();
  }

  Future<ChugumeType?> _fetchChugume() async {
    try {
      final repository = ref.read(userRepositoryProvider);
      return await repository.getChugume();
    } catch (e) {
      debugPrint("Fetch Chugume Error: $e");
      return null;
    }
  }

  Future<void> updateChugume(ChugumeType type) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(userRepositoryProvider);
      await repository.updateChugume(
        ChugumeUpdate(chugumeType: type),
      );
      state = AsyncValue.data(type);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
