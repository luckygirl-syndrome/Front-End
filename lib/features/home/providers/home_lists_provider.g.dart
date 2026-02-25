// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_lists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$consideringListHash() => r'c983a00a394f590c41514410763dd1eb2bf0abe7';

/// See also [consideringList].
@ProviderFor(consideringList)
final consideringListProvider =
    AutoDisposeFutureProvider<List<ConsideringListItem>>.internal(
  consideringList,
  name: r'consideringListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$consideringListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConsideringListRef
    = AutoDisposeFutureProviderRef<List<ConsideringListItem>>;
String _$unboughtReceiptsListHash() =>
    r'e4ace93c5ab324af530a01f53343eb5d1047363f';

/// See also [unboughtReceiptsList].
@ProviderFor(unboughtReceiptsList)
final unboughtReceiptsListProvider =
    AutoDisposeFutureProvider<List<ReceiptListItem>>.internal(
  unboughtReceiptsList,
  name: r'unboughtReceiptsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unboughtReceiptsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnboughtReceiptsListRef
    = AutoDisposeFutureProviderRef<List<ReceiptListItem>>;
String _$receiptDetailHash() => r'0abeaa86c218c9ae6e275a9c05a244035b79569f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [receiptDetail].
@ProviderFor(receiptDetail)
const receiptDetailProvider = ReceiptDetailFamily();

/// See also [receiptDetail].
class ReceiptDetailFamily extends Family<AsyncValue<ReceiptDetail>> {
  /// See also [receiptDetail].
  const ReceiptDetailFamily();

  /// See also [receiptDetail].
  ReceiptDetailProvider call(
    int userProductId,
  ) {
    return ReceiptDetailProvider(
      userProductId,
    );
  }

  @override
  ReceiptDetailProvider getProviderOverride(
    covariant ReceiptDetailProvider provider,
  ) {
    return call(
      provider.userProductId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'receiptDetailProvider';
}

/// See also [receiptDetail].
class ReceiptDetailProvider extends AutoDisposeFutureProvider<ReceiptDetail> {
  /// See also [receiptDetail].
  ReceiptDetailProvider(
    int userProductId,
  ) : this._internal(
          (ref) => receiptDetail(
            ref as ReceiptDetailRef,
            userProductId,
          ),
          from: receiptDetailProvider,
          name: r'receiptDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$receiptDetailHash,
          dependencies: ReceiptDetailFamily._dependencies,
          allTransitiveDependencies:
              ReceiptDetailFamily._allTransitiveDependencies,
          userProductId: userProductId,
        );

  ReceiptDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userProductId,
  }) : super.internal();

  final int userProductId;

  @override
  Override overrideWith(
    FutureOr<ReceiptDetail> Function(ReceiptDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReceiptDetailProvider._internal(
        (ref) => create(ref as ReceiptDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userProductId: userProductId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ReceiptDetail> createElement() {
    return _ReceiptDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReceiptDetailProvider &&
        other.userProductId == userProductId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userProductId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReceiptDetailRef on AutoDisposeFutureProviderRef<ReceiptDetail> {
  /// The parameter `userProductId` of this provider.
  int get userProductId;
}

class _ReceiptDetailProviderElement
    extends AutoDisposeFutureProviderElement<ReceiptDetail>
    with ReceiptDetailRef {
  _ReceiptDetailProviderElement(super.provider);

  @override
  int get userProductId => (origin as ReceiptDetailProvider).userProductId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
