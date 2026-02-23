// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_img')
  String? get profileImg => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String nickname,
      @JsonKey(name: 'profile_img') String? profileImg,
      String? description});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? profileImg = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nickname,
      @JsonKey(name: 'profile_img') String? profileImg,
      String? description});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? profileImg = freezed,
    Object? description = freezed,
  }) {
    return _then(_$UserProfileImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.nickname,
      @JsonKey(name: 'profile_img') this.profileImg,
      this.description});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String nickname;
  @override
  @JsonKey(name: 'profile_img')
  final String? profileImg;
  @override
  final String? description;

  @override
  String toString() {
    return 'UserProfile(nickname: $nickname, profileImg: $profileImg, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nickname, profileImg, description);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String nickname,
      @JsonKey(name: 'profile_img') final String? profileImg,
      final String? description}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get nickname;
  @override
  @JsonKey(name: 'profile_img')
  String? get profileImg;
  @override
  String? get description;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileUpdateRequest _$ProfileUpdateRequestFromJson(Map<String, dynamic> json) {
  return _ProfileUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$ProfileUpdateRequest {
  String? get nickname => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_img')
  String? get profileImg => throw _privateConstructorUsedError;

  /// Serializes this ProfileUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileUpdateRequestCopyWith<ProfileUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileUpdateRequestCopyWith<$Res> {
  factory $ProfileUpdateRequestCopyWith(ProfileUpdateRequest value,
          $Res Function(ProfileUpdateRequest) then) =
      _$ProfileUpdateRequestCopyWithImpl<$Res, ProfileUpdateRequest>;
  @useResult
  $Res call(
      {String? nickname, @JsonKey(name: 'profile_img') String? profileImg});
}

/// @nodoc
class _$ProfileUpdateRequestCopyWithImpl<$Res,
        $Val extends ProfileUpdateRequest>
    implements $ProfileUpdateRequestCopyWith<$Res> {
  _$ProfileUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = freezed,
    Object? profileImg = freezed,
  }) {
    return _then(_value.copyWith(
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileUpdateRequestImplCopyWith<$Res>
    implements $ProfileUpdateRequestCopyWith<$Res> {
  factory _$$ProfileUpdateRequestImplCopyWith(_$ProfileUpdateRequestImpl value,
          $Res Function(_$ProfileUpdateRequestImpl) then) =
      __$$ProfileUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nickname, @JsonKey(name: 'profile_img') String? profileImg});
}

/// @nodoc
class __$$ProfileUpdateRequestImplCopyWithImpl<$Res>
    extends _$ProfileUpdateRequestCopyWithImpl<$Res, _$ProfileUpdateRequestImpl>
    implements _$$ProfileUpdateRequestImplCopyWith<$Res> {
  __$$ProfileUpdateRequestImplCopyWithImpl(_$ProfileUpdateRequestImpl _value,
      $Res Function(_$ProfileUpdateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = freezed,
    Object? profileImg = freezed,
  }) {
    return _then(_$ProfileUpdateRequestImpl(
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileUpdateRequestImpl implements _ProfileUpdateRequest {
  const _$ProfileUpdateRequestImpl(
      {this.nickname, @JsonKey(name: 'profile_img') this.profileImg});

  factory _$ProfileUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileUpdateRequestImplFromJson(json);

  @override
  final String? nickname;
  @override
  @JsonKey(name: 'profile_img')
  final String? profileImg;

  @override
  String toString() {
    return 'ProfileUpdateRequest(nickname: $nickname, profileImg: $profileImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateRequestImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nickname, profileImg);

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpdateRequestImplCopyWith<_$ProfileUpdateRequestImpl>
      get copyWith =>
          __$$ProfileUpdateRequestImplCopyWithImpl<_$ProfileUpdateRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _ProfileUpdateRequest implements ProfileUpdateRequest {
  const factory _ProfileUpdateRequest(
          {final String? nickname,
          @JsonKey(name: 'profile_img') final String? profileImg}) =
      _$ProfileUpdateRequestImpl;

  factory _ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$ProfileUpdateRequestImpl.fromJson;

  @override
  String? get nickname;
  @override
  @JsonKey(name: 'profile_img')
  String? get profileImg;

  /// Create a copy of ProfileUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUpdateRequestImplCopyWith<_$ProfileUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClosetStats _$ClosetStatsFromJson(Map<String, dynamic> json) {
  return _ClosetStats.fromJson(json);
}

/// @nodoc
mixin _$ClosetStats {
  @JsonKey(name: 'bought_count')
  int get boughtCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'bought_price')
  int get boughtPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropped_count')
  int get droppedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dropped_price')
  int get droppedPrice => throw _privateConstructorUsedError;

  /// Serializes this ClosetStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClosetStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClosetStatsCopyWith<ClosetStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosetStatsCopyWith<$Res> {
  factory $ClosetStatsCopyWith(
          ClosetStats value, $Res Function(ClosetStats) then) =
      _$ClosetStatsCopyWithImpl<$Res, ClosetStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bought_count') int boughtCount,
      @JsonKey(name: 'bought_price') int boughtPrice,
      @JsonKey(name: 'dropped_count') int droppedCount,
      @JsonKey(name: 'dropped_price') int droppedPrice});
}

/// @nodoc
class _$ClosetStatsCopyWithImpl<$Res, $Val extends ClosetStats>
    implements $ClosetStatsCopyWith<$Res> {
  _$ClosetStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClosetStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boughtCount = null,
    Object? boughtPrice = null,
    Object? droppedCount = null,
    Object? droppedPrice = null,
  }) {
    return _then(_value.copyWith(
      boughtCount: null == boughtCount
          ? _value.boughtCount
          : boughtCount // ignore: cast_nullable_to_non_nullable
              as int,
      boughtPrice: null == boughtPrice
          ? _value.boughtPrice
          : boughtPrice // ignore: cast_nullable_to_non_nullable
              as int,
      droppedCount: null == droppedCount
          ? _value.droppedCount
          : droppedCount // ignore: cast_nullable_to_non_nullable
              as int,
      droppedPrice: null == droppedPrice
          ? _value.droppedPrice
          : droppedPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClosetStatsImplCopyWith<$Res>
    implements $ClosetStatsCopyWith<$Res> {
  factory _$$ClosetStatsImplCopyWith(
          _$ClosetStatsImpl value, $Res Function(_$ClosetStatsImpl) then) =
      __$$ClosetStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bought_count') int boughtCount,
      @JsonKey(name: 'bought_price') int boughtPrice,
      @JsonKey(name: 'dropped_count') int droppedCount,
      @JsonKey(name: 'dropped_price') int droppedPrice});
}

/// @nodoc
class __$$ClosetStatsImplCopyWithImpl<$Res>
    extends _$ClosetStatsCopyWithImpl<$Res, _$ClosetStatsImpl>
    implements _$$ClosetStatsImplCopyWith<$Res> {
  __$$ClosetStatsImplCopyWithImpl(
      _$ClosetStatsImpl _value, $Res Function(_$ClosetStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClosetStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boughtCount = null,
    Object? boughtPrice = null,
    Object? droppedCount = null,
    Object? droppedPrice = null,
  }) {
    return _then(_$ClosetStatsImpl(
      boughtCount: null == boughtCount
          ? _value.boughtCount
          : boughtCount // ignore: cast_nullable_to_non_nullable
              as int,
      boughtPrice: null == boughtPrice
          ? _value.boughtPrice
          : boughtPrice // ignore: cast_nullable_to_non_nullable
              as int,
      droppedCount: null == droppedCount
          ? _value.droppedCount
          : droppedCount // ignore: cast_nullable_to_non_nullable
              as int,
      droppedPrice: null == droppedPrice
          ? _value.droppedPrice
          : droppedPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClosetStatsImpl implements _ClosetStats {
  const _$ClosetStatsImpl(
      {@JsonKey(name: 'bought_count') required this.boughtCount,
      @JsonKey(name: 'bought_price') required this.boughtPrice,
      @JsonKey(name: 'dropped_count') required this.droppedCount,
      @JsonKey(name: 'dropped_price') required this.droppedPrice});

  factory _$ClosetStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClosetStatsImplFromJson(json);

  @override
  @JsonKey(name: 'bought_count')
  final int boughtCount;
  @override
  @JsonKey(name: 'bought_price')
  final int boughtPrice;
  @override
  @JsonKey(name: 'dropped_count')
  final int droppedCount;
  @override
  @JsonKey(name: 'dropped_price')
  final int droppedPrice;

  @override
  String toString() {
    return 'ClosetStats(boughtCount: $boughtCount, boughtPrice: $boughtPrice, droppedCount: $droppedCount, droppedPrice: $droppedPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosetStatsImpl &&
            (identical(other.boughtCount, boughtCount) ||
                other.boughtCount == boughtCount) &&
            (identical(other.boughtPrice, boughtPrice) ||
                other.boughtPrice == boughtPrice) &&
            (identical(other.droppedCount, droppedCount) ||
                other.droppedCount == droppedCount) &&
            (identical(other.droppedPrice, droppedPrice) ||
                other.droppedPrice == droppedPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, boughtCount, boughtPrice, droppedCount, droppedPrice);

  /// Create a copy of ClosetStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosetStatsImplCopyWith<_$ClosetStatsImpl> get copyWith =>
      __$$ClosetStatsImplCopyWithImpl<_$ClosetStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClosetStatsImplToJson(
      this,
    );
  }
}

abstract class _ClosetStats implements ClosetStats {
  const factory _ClosetStats(
          {@JsonKey(name: 'bought_count') required final int boughtCount,
          @JsonKey(name: 'bought_price') required final int boughtPrice,
          @JsonKey(name: 'dropped_count') required final int droppedCount,
          @JsonKey(name: 'dropped_price') required final int droppedPrice}) =
      _$ClosetStatsImpl;

  factory _ClosetStats.fromJson(Map<String, dynamic> json) =
      _$ClosetStatsImpl.fromJson;

  @override
  @JsonKey(name: 'bought_count')
  int get boughtCount;
  @override
  @JsonKey(name: 'bought_price')
  int get boughtPrice;
  @override
  @JsonKey(name: 'dropped_count')
  int get droppedCount;
  @override
  @JsonKey(name: 'dropped_price')
  int get droppedPrice;

  /// Create a copy of ClosetStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClosetStatsImplCopyWith<_$ClosetStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
