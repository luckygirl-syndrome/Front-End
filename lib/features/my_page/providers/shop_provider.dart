import 'package:flutter/foundation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/my_page/models/shop_model.dart';
import 'package:ttobaba/features/my_page/repositories/user_repository.dart';

part 'shop_provider.g.dart';

@riverpod
class FavoriteShops extends _$FavoriteShops {
  @override
  FutureOr<List<ShopName>> build() async {
    return _fetchShops();
  }

  Future<List<ShopName>> _fetchShops() async {
    try {
      final repository = ref.read(userRepositoryProvider);
      return await repository.getFavoriteShops();
    } catch (e) {
      debugPrint("Fetch Favorite Shops Error: $e");
      return [];
    }
  }

  Future<void> updateShops(List<ShopName> shops) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(userRepositoryProvider);
      await repository.updateFavoriteShops(
        UserShopsUpdate(favoriteShops: shops),
      );
      state = AsyncValue.data(shops);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
