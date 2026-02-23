// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserShopsUpdate _$UserShopsUpdateFromJson(Map<String, dynamic> json) {
  return _UserShopsUpdate.fromJson(json);
}

/// @nodoc
mixin _$UserShopsUpdate {
  @JsonKey(name: 'favorite_shops')
  List<ShopName> get favoriteShops => throw _privateConstructorUsedError;

  /// Serializes this UserShopsUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserShopsUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserShopsUpdateCopyWith<UserShopsUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserShopsUpdateCopyWith<$Res> {
  factory $UserShopsUpdateCopyWith(
          UserShopsUpdate value, $Res Function(UserShopsUpdate) then) =
      _$UserShopsUpdateCopyWithImpl<$Res, UserShopsUpdate>;
  @useResult
  $Res call({@JsonKey(name: 'favorite_shops') List<ShopName> favoriteShops});
}

/// @nodoc
class _$UserShopsUpdateCopyWithImpl<$Res, $Val extends UserShopsUpdate>
    implements $UserShopsUpdateCopyWith<$Res> {
  _$UserShopsUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserShopsUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteShops = null,
  }) {
    return _then(_value.copyWith(
      favoriteShops: null == favoriteShops
          ? _value.favoriteShops
          : favoriteShops // ignore: cast_nullable_to_non_nullable
              as List<ShopName>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserShopsUpdateImplCopyWith<$Res>
    implements $UserShopsUpdateCopyWith<$Res> {
  factory _$$UserShopsUpdateImplCopyWith(_$UserShopsUpdateImpl value,
          $Res Function(_$UserShopsUpdateImpl) then) =
      __$$UserShopsUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'favorite_shops') List<ShopName> favoriteShops});
}

/// @nodoc
class __$$UserShopsUpdateImplCopyWithImpl<$Res>
    extends _$UserShopsUpdateCopyWithImpl<$Res, _$UserShopsUpdateImpl>
    implements _$$UserShopsUpdateImplCopyWith<$Res> {
  __$$UserShopsUpdateImplCopyWithImpl(
      _$UserShopsUpdateImpl _value, $Res Function(_$UserShopsUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserShopsUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteShops = null,
  }) {
    return _then(_$UserShopsUpdateImpl(
      favoriteShops: null == favoriteShops
          ? _value._favoriteShops
          : favoriteShops // ignore: cast_nullable_to_non_nullable
              as List<ShopName>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserShopsUpdateImpl implements _UserShopsUpdate {
  const _$UserShopsUpdateImpl(
      {@JsonKey(name: 'favorite_shops')
      required final List<ShopName> favoriteShops})
      : _favoriteShops = favoriteShops;

  factory _$UserShopsUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserShopsUpdateImplFromJson(json);

  final List<ShopName> _favoriteShops;
  @override
  @JsonKey(name: 'favorite_shops')
  List<ShopName> get favoriteShops {
    if (_favoriteShops is EqualUnmodifiableListView) return _favoriteShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteShops);
  }

  @override
  String toString() {
    return 'UserShopsUpdate(favoriteShops: $favoriteShops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserShopsUpdateImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteShops, _favoriteShops));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteShops));

  /// Create a copy of UserShopsUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserShopsUpdateImplCopyWith<_$UserShopsUpdateImpl> get copyWith =>
      __$$UserShopsUpdateImplCopyWithImpl<_$UserShopsUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserShopsUpdateImplToJson(
      this,
    );
  }
}

abstract class _UserShopsUpdate implements UserShopsUpdate {
  const factory _UserShopsUpdate(
      {@JsonKey(name: 'favorite_shops')
      required final List<ShopName> favoriteShops}) = _$UserShopsUpdateImpl;

  factory _UserShopsUpdate.fromJson(Map<String, dynamic> json) =
      _$UserShopsUpdateImpl.fromJson;

  @override
  @JsonKey(name: 'favorite_shops')
  List<ShopName> get favoriteShops;

  /// Create a copy of UserShopsUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserShopsUpdateImplCopyWith<_$UserShopsUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
