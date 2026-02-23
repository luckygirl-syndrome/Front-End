// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chugume_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChugumeUpdate _$ChugumeUpdateFromJson(Map<String, dynamic> json) {
  return _ChugumeUpdate.fromJson(json);
}

/// @nodoc
mixin _$ChugumeUpdate {
  @JsonKey(name: 'chugume_type')
  ChugumeType get chugumeType => throw _privateConstructorUsedError;

  /// Serializes this ChugumeUpdate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChugumeUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChugumeUpdateCopyWith<ChugumeUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChugumeUpdateCopyWith<$Res> {
  factory $ChugumeUpdateCopyWith(
          ChugumeUpdate value, $Res Function(ChugumeUpdate) then) =
      _$ChugumeUpdateCopyWithImpl<$Res, ChugumeUpdate>;
  @useResult
  $Res call({@JsonKey(name: 'chugume_type') ChugumeType chugumeType});
}

/// @nodoc
class _$ChugumeUpdateCopyWithImpl<$Res, $Val extends ChugumeUpdate>
    implements $ChugumeUpdateCopyWith<$Res> {
  _$ChugumeUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChugumeUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chugumeType = null,
  }) {
    return _then(_value.copyWith(
      chugumeType: null == chugumeType
          ? _value.chugumeType
          : chugumeType // ignore: cast_nullable_to_non_nullable
              as ChugumeType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChugumeUpdateImplCopyWith<$Res>
    implements $ChugumeUpdateCopyWith<$Res> {
  factory _$$ChugumeUpdateImplCopyWith(
          _$ChugumeUpdateImpl value, $Res Function(_$ChugumeUpdateImpl) then) =
      __$$ChugumeUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'chugume_type') ChugumeType chugumeType});
}

/// @nodoc
class __$$ChugumeUpdateImplCopyWithImpl<$Res>
    extends _$ChugumeUpdateCopyWithImpl<$Res, _$ChugumeUpdateImpl>
    implements _$$ChugumeUpdateImplCopyWith<$Res> {
  __$$ChugumeUpdateImplCopyWithImpl(
      _$ChugumeUpdateImpl _value, $Res Function(_$ChugumeUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChugumeUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chugumeType = null,
  }) {
    return _then(_$ChugumeUpdateImpl(
      chugumeType: null == chugumeType
          ? _value.chugumeType
          : chugumeType // ignore: cast_nullable_to_non_nullable
              as ChugumeType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChugumeUpdateImpl implements _ChugumeUpdate {
  const _$ChugumeUpdateImpl(
      {@JsonKey(name: 'chugume_type') required this.chugumeType});

  factory _$ChugumeUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChugumeUpdateImplFromJson(json);

  @override
  @JsonKey(name: 'chugume_type')
  final ChugumeType chugumeType;

  @override
  String toString() {
    return 'ChugumeUpdate(chugumeType: $chugumeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChugumeUpdateImpl &&
            (identical(other.chugumeType, chugumeType) ||
                other.chugumeType == chugumeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chugumeType);

  /// Create a copy of ChugumeUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChugumeUpdateImplCopyWith<_$ChugumeUpdateImpl> get copyWith =>
      __$$ChugumeUpdateImplCopyWithImpl<_$ChugumeUpdateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChugumeUpdateImplToJson(
      this,
    );
  }
}

abstract class _ChugumeUpdate implements ChugumeUpdate {
  const factory _ChugumeUpdate(
      {@JsonKey(name: 'chugume_type')
      required final ChugumeType chugumeType}) = _$ChugumeUpdateImpl;

  factory _ChugumeUpdate.fromJson(Map<String, dynamic> json) =
      _$ChugumeUpdateImpl.fromJson;

  @override
  @JsonKey(name: 'chugume_type')
  ChugumeType get chugumeType;

  /// Create a copy of ChugumeUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChugumeUpdateImplCopyWith<_$ChugumeUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
