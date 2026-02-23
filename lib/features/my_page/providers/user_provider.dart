import 'package:flutter/foundation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/my_page/models/user_model.dart';
import 'package:ttobaba/features/my_page/repositories/user_repository.dart';

part 'user_provider.g.dart';

@riverpod
class User extends _$User {
  @override
  FutureOr<UserProfile?> build() async {
    return _fetchUser();
  }

  Future<UserProfile?> _fetchUser() async {
    try {
      final repository = ref.read(userRepositoryProvider);
      return await repository.getProfile();
    } catch (e) {
      // Handle error or return null
      debugPrint("Fetch User Error: $e");
      return null;
    }
  }

  Future<void> updateProfile(ProfileUpdateRequest request) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(userRepositoryProvider);
      await repository.updateProfile(request);
      // Refresh user data
      ref.invalidateSelf();
      await future;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
