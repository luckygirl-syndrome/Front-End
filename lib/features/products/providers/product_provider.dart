import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/features/products/repositories/product_repository.dart';

// 상품 파싱 상태
class ProductParseState {
  final bool isLoading;
  final Map<String, dynamic>? result;
  final String? error;
  final String? inputUrl;

  ProductParseState({
    this.isLoading = false,
    this.result,
    this.error,
    this.inputUrl,
  });

  ProductParseState copyWith({
    bool? isLoading,
    Map<String, dynamic>? result,
    String? error,
    String? inputUrl,
  }) {
    return ProductParseState(
      isLoading: isLoading ?? this.isLoading,
      result: result ?? this.result,
      error: error ?? this.error,
      inputUrl: inputUrl ?? this.inputUrl,
    );
  }
}

// 상품 파싱 Notifier
class ProductParseNotifier extends StateNotifier<ProductParseState> {
  final Ref ref;

  ProductParseNotifier(this.ref) : super(ProductParseState());

  /// 상품 URL을 파싱합니다.
  Future<Map<String, dynamic>?> parseProduct(String url) async {
    state = ProductParseState(isLoading: true, inputUrl: url);

    try {
      final repository = ref.read(productRepositoryProvider);
      final result = await repository.parseProductUrl(url);
      state = ProductParseState(
        isLoading: false,
        result: result,
        inputUrl: url,
      );
      return result;
    } catch (e) {
      debugPrint("❌ [Product Parse] Error: $e");
      state = ProductParseState(
        isLoading: false,
        error: e.toString(),
        inputUrl: url,
      );
      return null;
    }
  }

  /// 상태 리셋
  void reset() => state = ProductParseState();
}

// Provider 선언
final productParseProvider =
    StateNotifierProvider<ProductParseNotifier, ProductParseState>((ref) {
  return ProductParseNotifier(ref);
});
