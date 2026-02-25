// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AxisScore _$AxisScoreFromJson(Map<String, dynamic> json) {
  return _AxisScore.fromJson(json);
}

/// @nodoc
mixin _$AxisScore {
  String get result => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Serializes this AxisScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AxisScoreCopyWith<AxisScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AxisScoreCopyWith<$Res> {
  factory $AxisScoreCopyWith(AxisScore value, $Res Function(AxisScore) then) =
      _$AxisScoreCopyWithImpl<$Res, AxisScore>;
  @useResult
  $Res call({String result, int score});
}

/// @nodoc
class _$AxisScoreCopyWithImpl<$Res, $Val extends AxisScore>
    implements $AxisScoreCopyWith<$Res> {
  _$AxisScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AxisScoreImplCopyWith<$Res>
    implements $AxisScoreCopyWith<$Res> {
  factory _$$AxisScoreImplCopyWith(
          _$AxisScoreImpl value, $Res Function(_$AxisScoreImpl) then) =
      __$$AxisScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result, int score});
}

/// @nodoc
class __$$AxisScoreImplCopyWithImpl<$Res>
    extends _$AxisScoreCopyWithImpl<$Res, _$AxisScoreImpl>
    implements _$$AxisScoreImplCopyWith<$Res> {
  __$$AxisScoreImplCopyWithImpl(
      _$AxisScoreImpl _value, $Res Function(_$AxisScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? score = null,
  }) {
    return _then(_$AxisScoreImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AxisScoreImpl implements _AxisScore {
  const _$AxisScoreImpl({required this.result, required this.score});

  factory _$AxisScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$AxisScoreImplFromJson(json);

  @override
  final String result;
  @override
  final int score;

  @override
  String toString() {
    return 'AxisScore(result: $result, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AxisScoreImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, score);

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AxisScoreImplCopyWith<_$AxisScoreImpl> get copyWith =>
      __$$AxisScoreImplCopyWithImpl<_$AxisScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AxisScoreImplToJson(
      this,
    );
  }
}

abstract class _AxisScore implements AxisScore {
  const factory _AxisScore(
      {required final String result,
      required final int score}) = _$AxisScoreImpl;

  factory _AxisScore.fromJson(Map<String, dynamic> json) =
      _$AxisScoreImpl.fromJson;

  @override
  String get result;
  @override
  int get score;

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AxisScoreImplCopyWith<_$AxisScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeDashboardData _$HomeDashboardDataFromJson(Map<String, dynamic> json) {
  return _HomeDashboardData.fromJson(json);
}

/// @nodoc
mixin _$HomeDashboardData {
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'saved_amount')
  int get savedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_chat_count')
  int get recentChatCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_chat_count')
  int get totalChatCount => throw _privateConstructorUsedError;

  /// Serializes this HomeDashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeDashboardDataCopyWith<HomeDashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDashboardDataCopyWith<$Res> {
  factory $HomeDashboardDataCopyWith(
          HomeDashboardData value, $Res Function(HomeDashboardData) then) =
      _$HomeDashboardDataCopyWithImpl<$Res, HomeDashboardData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'saved_amount') int savedAmount,
      @JsonKey(name: 'recent_chat_count') int recentChatCount,
      @JsonKey(name: 'total_chat_count') int totalChatCount});
}

/// @nodoc
class _$HomeDashboardDataCopyWithImpl<$Res, $Val extends HomeDashboardData>
    implements $HomeDashboardDataCopyWith<$Res> {
  _$HomeDashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? savedAmount = null,
    Object? recentChatCount = null,
    Object? totalChatCount = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      savedAmount: null == savedAmount
          ? _value.savedAmount
          : savedAmount // ignore: cast_nullable_to_non_nullable
              as int,
      recentChatCount: null == recentChatCount
          ? _value.recentChatCount
          : recentChatCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalChatCount: null == totalChatCount
          ? _value.totalChatCount
          : totalChatCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeDashboardDataImplCopyWith<$Res>
    implements $HomeDashboardDataCopyWith<$Res> {
  factory _$$HomeDashboardDataImplCopyWith(_$HomeDashboardDataImpl value,
          $Res Function(_$HomeDashboardDataImpl) then) =
      __$$HomeDashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'saved_amount') int savedAmount,
      @JsonKey(name: 'recent_chat_count') int recentChatCount,
      @JsonKey(name: 'total_chat_count') int totalChatCount});
}

/// @nodoc
class __$$HomeDashboardDataImplCopyWithImpl<$Res>
    extends _$HomeDashboardDataCopyWithImpl<$Res, _$HomeDashboardDataImpl>
    implements _$$HomeDashboardDataImplCopyWith<$Res> {
  __$$HomeDashboardDataImplCopyWithImpl(_$HomeDashboardDataImpl _value,
      $Res Function(_$HomeDashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? savedAmount = null,
    Object? recentChatCount = null,
    Object? totalChatCount = null,
  }) {
    return _then(_$HomeDashboardDataImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      savedAmount: null == savedAmount
          ? _value.savedAmount
          : savedAmount // ignore: cast_nullable_to_non_nullable
              as int,
      recentChatCount: null == recentChatCount
          ? _value.recentChatCount
          : recentChatCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalChatCount: null == totalChatCount
          ? _value.totalChatCount
          : totalChatCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDashboardDataImpl implements _HomeDashboardData {
  const _$HomeDashboardDataImpl(
      {@JsonKey(name: 'user_name') required this.userName,
      @JsonKey(name: 'saved_amount') required this.savedAmount,
      @JsonKey(name: 'recent_chat_count') required this.recentChatCount,
      @JsonKey(name: 'total_chat_count') required this.totalChatCount});

  factory _$HomeDashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDashboardDataImplFromJson(json);

  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  @JsonKey(name: 'saved_amount')
  final int savedAmount;
  @override
  @JsonKey(name: 'recent_chat_count')
  final int recentChatCount;
  @override
  @JsonKey(name: 'total_chat_count')
  final int totalChatCount;

  @override
  String toString() {
    return 'HomeDashboardData(userName: $userName, savedAmount: $savedAmount, recentChatCount: $recentChatCount, totalChatCount: $totalChatCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDashboardDataImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.savedAmount, savedAmount) ||
                other.savedAmount == savedAmount) &&
            (identical(other.recentChatCount, recentChatCount) ||
                other.recentChatCount == recentChatCount) &&
            (identical(other.totalChatCount, totalChatCount) ||
                other.totalChatCount == totalChatCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userName, savedAmount, recentChatCount, totalChatCount);

  /// Create a copy of HomeDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDashboardDataImplCopyWith<_$HomeDashboardDataImpl> get copyWith =>
      __$$HomeDashboardDataImplCopyWithImpl<_$HomeDashboardDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDashboardDataImplToJson(
      this,
    );
  }
}

abstract class _HomeDashboardData implements HomeDashboardData {
  const factory _HomeDashboardData(
      {@JsonKey(name: 'user_name') required final String userName,
      @JsonKey(name: 'saved_amount') required final int savedAmount,
      @JsonKey(name: 'recent_chat_count') required final int recentChatCount,
      @JsonKey(name: 'total_chat_count')
      required final int totalChatCount}) = _$HomeDashboardDataImpl;

  factory _HomeDashboardData.fromJson(Map<String, dynamic> json) =
      _$HomeDashboardDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  @JsonKey(name: 'saved_amount')
  int get savedAmount;
  @override
  @JsonKey(name: 'recent_chat_count')
  int get recentChatCount;
  @override
  @JsonKey(name: 'total_chat_count')
  int get totalChatCount;

  /// Create a copy of HomeDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDashboardDataImplCopyWith<_$HomeDashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeDashboardResponse _$HomeDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return _HomeDashboardResponse.fromJson(json);
}

/// @nodoc
mixin _$HomeDashboardResponse {
  String get status => throw _privateConstructorUsedError;
  HomeDashboardData get data => throw _privateConstructorUsedError;

  /// Serializes this HomeDashboardResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeDashboardResponseCopyWith<HomeDashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDashboardResponseCopyWith<$Res> {
  factory $HomeDashboardResponseCopyWith(HomeDashboardResponse value,
          $Res Function(HomeDashboardResponse) then) =
      _$HomeDashboardResponseCopyWithImpl<$Res, HomeDashboardResponse>;
  @useResult
  $Res call({String status, HomeDashboardData data});

  $HomeDashboardDataCopyWith<$Res> get data;
}

/// @nodoc
class _$HomeDashboardResponseCopyWithImpl<$Res,
        $Val extends HomeDashboardResponse>
    implements $HomeDashboardResponseCopyWith<$Res> {
  _$HomeDashboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HomeDashboardData,
    ) as $Val);
  }

  /// Create a copy of HomeDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeDashboardDataCopyWith<$Res> get data {
    return $HomeDashboardDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeDashboardResponseImplCopyWith<$Res>
    implements $HomeDashboardResponseCopyWith<$Res> {
  factory _$$HomeDashboardResponseImplCopyWith(
          _$HomeDashboardResponseImpl value,
          $Res Function(_$HomeDashboardResponseImpl) then) =
      __$$HomeDashboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, HomeDashboardData data});

  @override
  $HomeDashboardDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$HomeDashboardResponseImplCopyWithImpl<$Res>
    extends _$HomeDashboardResponseCopyWithImpl<$Res,
        _$HomeDashboardResponseImpl>
    implements _$$HomeDashboardResponseImplCopyWith<$Res> {
  __$$HomeDashboardResponseImplCopyWithImpl(_$HomeDashboardResponseImpl _value,
      $Res Function(_$HomeDashboardResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$HomeDashboardResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HomeDashboardData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDashboardResponseImpl implements _HomeDashboardResponse {
  const _$HomeDashboardResponseImpl({required this.status, required this.data});

  factory _$HomeDashboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDashboardResponseImplFromJson(json);

  @override
  final String status;
  @override
  final HomeDashboardData data;

  @override
  String toString() {
    return 'HomeDashboardResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDashboardResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of HomeDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDashboardResponseImplCopyWith<_$HomeDashboardResponseImpl>
      get copyWith => __$$HomeDashboardResponseImplCopyWithImpl<
          _$HomeDashboardResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDashboardResponseImplToJson(
      this,
    );
  }
}

abstract class _HomeDashboardResponse implements HomeDashboardResponse {
  const factory _HomeDashboardResponse(
      {required final String status,
      required final HomeDashboardData data}) = _$HomeDashboardResponseImpl;

  factory _HomeDashboardResponse.fromJson(Map<String, dynamic> json) =
      _$HomeDashboardResponseImpl.fromJson;

  @override
  String get status;
  @override
  HomeDashboardData get data;

  /// Create a copy of HomeDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDashboardResponseImplCopyWith<_$HomeDashboardResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ConsideringListItem _$ConsideringListItemFromJson(Map<String, dynamic> json) {
  return _ConsideringListItem.fromJson(json);
}

/// @nodoc
mixin _$ConsideringListItem {
  @JsonKey(name: 'user_product_id')
  int get userProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_img')
  String? get productImg => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_days')
  int? get durationDays => throw _privateConstructorUsedError;

  /// Serializes this ConsideringListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsideringListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsideringListItemCopyWith<ConsideringListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsideringListItemCopyWith<$Res> {
  factory $ConsideringListItemCopyWith(
          ConsideringListItem value, $Res Function(ConsideringListItem) then) =
      _$ConsideringListItemCopyWithImpl<$Res, ConsideringListItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'duration_days') int? durationDays});
}

/// @nodoc
class _$ConsideringListItemCopyWithImpl<$Res, $Val extends ConsideringListItem>
    implements $ConsideringListItemCopyWith<$Res> {
  _$ConsideringListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsideringListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? durationDays = freezed,
  }) {
    return _then(_value.copyWith(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImg: freezed == productImg
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: freezed == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsideringListItemImplCopyWith<$Res>
    implements $ConsideringListItemCopyWith<$Res> {
  factory _$$ConsideringListItemImplCopyWith(_$ConsideringListItemImpl value,
          $Res Function(_$ConsideringListItemImpl) then) =
      __$$ConsideringListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'duration_days') int? durationDays});
}

/// @nodoc
class __$$ConsideringListItemImplCopyWithImpl<$Res>
    extends _$ConsideringListItemCopyWithImpl<$Res, _$ConsideringListItemImpl>
    implements _$$ConsideringListItemImplCopyWith<$Res> {
  __$$ConsideringListItemImplCopyWithImpl(_$ConsideringListItemImpl _value,
      $Res Function(_$ConsideringListItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsideringListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? durationDays = freezed,
  }) {
    return _then(_$ConsideringListItemImpl(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImg: freezed == productImg
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      durationDays: freezed == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsideringListItemImpl implements _ConsideringListItem {
  const _$ConsideringListItemImpl(
      {@JsonKey(name: 'user_product_id') required this.userProductId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_img') this.productImg,
      required this.price,
      @JsonKey(name: 'duration_days') this.durationDays});

  factory _$ConsideringListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsideringListItemImplFromJson(json);

  @override
  @JsonKey(name: 'user_product_id')
  final int userProductId;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_img')
  final String? productImg;
  @override
  final int price;
  @override
  @JsonKey(name: 'duration_days')
  final int? durationDays;

  @override
  String toString() {
    return 'ConsideringListItem(userProductId: $userProductId, productId: $productId, productName: $productName, productImg: $productImg, price: $price, durationDays: $durationDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsideringListItemImpl &&
            (identical(other.userProductId, userProductId) ||
                other.userProductId == userProductId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImg, productImg) ||
                other.productImg == productImg) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userProductId, productId,
      productName, productImg, price, durationDays);

  /// Create a copy of ConsideringListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsideringListItemImplCopyWith<_$ConsideringListItemImpl> get copyWith =>
      __$$ConsideringListItemImplCopyWithImpl<_$ConsideringListItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsideringListItemImplToJson(
      this,
    );
  }
}

abstract class _ConsideringListItem implements ConsideringListItem {
  const factory _ConsideringListItem(
          {@JsonKey(name: 'user_product_id') required final int userProductId,
          @JsonKey(name: 'product_id') required final int productId,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'product_img') final String? productImg,
          required final int price,
          @JsonKey(name: 'duration_days') final int? durationDays}) =
      _$ConsideringListItemImpl;

  factory _ConsideringListItem.fromJson(Map<String, dynamic> json) =
      _$ConsideringListItemImpl.fromJson;

  @override
  @JsonKey(name: 'user_product_id')
  int get userProductId;
  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_img')
  String? get productImg;
  @override
  int get price;
  @override
  @JsonKey(name: 'duration_days')
  int? get durationDays;

  /// Create a copy of ConsideringListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsideringListItemImplCopyWith<_$ConsideringListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConsideringListResponse _$ConsideringListResponseFromJson(
    Map<String, dynamic> json) {
  return _ConsideringListResponse.fromJson(json);
}

/// @nodoc
mixin _$ConsideringListResponse {
  String get status => throw _privateConstructorUsedError;
  List<ConsideringListItem> get data => throw _privateConstructorUsedError;

  /// Serializes this ConsideringListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsideringListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsideringListResponseCopyWith<ConsideringListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsideringListResponseCopyWith<$Res> {
  factory $ConsideringListResponseCopyWith(ConsideringListResponse value,
          $Res Function(ConsideringListResponse) then) =
      _$ConsideringListResponseCopyWithImpl<$Res, ConsideringListResponse>;
  @useResult
  $Res call({String status, List<ConsideringListItem> data});
}

/// @nodoc
class _$ConsideringListResponseCopyWithImpl<$Res,
        $Val extends ConsideringListResponse>
    implements $ConsideringListResponseCopyWith<$Res> {
  _$ConsideringListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsideringListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ConsideringListItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsideringListResponseImplCopyWith<$Res>
    implements $ConsideringListResponseCopyWith<$Res> {
  factory _$$ConsideringListResponseImplCopyWith(
          _$ConsideringListResponseImpl value,
          $Res Function(_$ConsideringListResponseImpl) then) =
      __$$ConsideringListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<ConsideringListItem> data});
}

/// @nodoc
class __$$ConsideringListResponseImplCopyWithImpl<$Res>
    extends _$ConsideringListResponseCopyWithImpl<$Res,
        _$ConsideringListResponseImpl>
    implements _$$ConsideringListResponseImplCopyWith<$Res> {
  __$$ConsideringListResponseImplCopyWithImpl(
      _$ConsideringListResponseImpl _value,
      $Res Function(_$ConsideringListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsideringListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$ConsideringListResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ConsideringListItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsideringListResponseImpl implements _ConsideringListResponse {
  const _$ConsideringListResponseImpl(
      {required this.status, required final List<ConsideringListItem> data})
      : _data = data;

  factory _$ConsideringListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsideringListResponseImplFromJson(json);

  @override
  final String status;
  final List<ConsideringListItem> _data;
  @override
  List<ConsideringListItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ConsideringListResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsideringListResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ConsideringListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsideringListResponseImplCopyWith<_$ConsideringListResponseImpl>
      get copyWith => __$$ConsideringListResponseImplCopyWithImpl<
          _$ConsideringListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsideringListResponseImplToJson(
      this,
    );
  }
}

abstract class _ConsideringListResponse implements ConsideringListResponse {
  const factory _ConsideringListResponse(
          {required final String status,
          required final List<ConsideringListItem> data}) =
      _$ConsideringListResponseImpl;

  factory _ConsideringListResponse.fromJson(Map<String, dynamic> json) =
      _$ConsideringListResponseImpl.fromJson;

  @override
  String get status;
  @override
  List<ConsideringListItem> get data;

  /// Create a copy of ConsideringListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsideringListResponseImplCopyWith<_$ConsideringListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReceiptListItem _$ReceiptListItemFromJson(Map<String, dynamic> json) {
  return _ReceiptListItem.fromJson(json);
}

/// @nodoc
mixin _$ReceiptListItem {
  @JsonKey(name: 'user_product_id')
  int get userProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_img')
  String? get productImg => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_rate')
  double? get discountRate => throw _privateConstructorUsedError;

  /// Serializes this ReceiptListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptListItemCopyWith<ReceiptListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptListItemCopyWith<$Res> {
  factory $ReceiptListItemCopyWith(
          ReceiptListItem value, $Res Function(ReceiptListItem) then) =
      _$ReceiptListItemCopyWithImpl<$Res, ReceiptListItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'discount_rate') double? discountRate});
}

/// @nodoc
class _$ReceiptListItemCopyWithImpl<$Res, $Val extends ReceiptListItem>
    implements $ReceiptListItemCopyWith<$Res> {
  _$ReceiptListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? discountRate = freezed,
  }) {
    return _then(_value.copyWith(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImg: freezed == productImg
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptListItemImplCopyWith<$Res>
    implements $ReceiptListItemCopyWith<$Res> {
  factory _$$ReceiptListItemImplCopyWith(_$ReceiptListItemImpl value,
          $Res Function(_$ReceiptListItemImpl) then) =
      __$$ReceiptListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'discount_rate') double? discountRate});
}

/// @nodoc
class __$$ReceiptListItemImplCopyWithImpl<$Res>
    extends _$ReceiptListItemCopyWithImpl<$Res, _$ReceiptListItemImpl>
    implements _$$ReceiptListItemImplCopyWith<$Res> {
  __$$ReceiptListItemImplCopyWithImpl(
      _$ReceiptListItemImpl _value, $Res Function(_$ReceiptListItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? discountRate = freezed,
  }) {
    return _then(_$ReceiptListItemImpl(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImg: freezed == productImg
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptListItemImpl implements _ReceiptListItem {
  const _$ReceiptListItemImpl(
      {@JsonKey(name: 'user_product_id') required this.userProductId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_img') this.productImg,
      required this.price,
      @JsonKey(name: 'discount_rate') this.discountRate});

  factory _$ReceiptListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptListItemImplFromJson(json);

  @override
  @JsonKey(name: 'user_product_id')
  final int userProductId;
  @override
  @JsonKey(name: 'product_id')
  final int productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_img')
  final String? productImg;
  @override
  final int price;
  @override
  @JsonKey(name: 'discount_rate')
  final double? discountRate;

  @override
  String toString() {
    return 'ReceiptListItem(userProductId: $userProductId, productId: $productId, productName: $productName, productImg: $productImg, price: $price, discountRate: $discountRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptListItemImpl &&
            (identical(other.userProductId, userProductId) ||
                other.userProductId == userProductId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImg, productImg) ||
                other.productImg == productImg) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userProductId, productId,
      productName, productImg, price, discountRate);

  /// Create a copy of ReceiptListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptListItemImplCopyWith<_$ReceiptListItemImpl> get copyWith =>
      __$$ReceiptListItemImplCopyWithImpl<_$ReceiptListItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptListItemImplToJson(
      this,
    );
  }
}

abstract class _ReceiptListItem implements ReceiptListItem {
  const factory _ReceiptListItem(
          {@JsonKey(name: 'user_product_id') required final int userProductId,
          @JsonKey(name: 'product_id') required final int productId,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'product_img') final String? productImg,
          required final int price,
          @JsonKey(name: 'discount_rate') final double? discountRate}) =
      _$ReceiptListItemImpl;

  factory _ReceiptListItem.fromJson(Map<String, dynamic> json) =
      _$ReceiptListItemImpl.fromJson;

  @override
  @JsonKey(name: 'user_product_id')
  int get userProductId;
  @override
  @JsonKey(name: 'product_id')
  int get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_img')
  String? get productImg;
  @override
  int get price;
  @override
  @JsonKey(name: 'discount_rate')
  double? get discountRate;

  /// Create a copy of ReceiptListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptListItemImplCopyWith<_$ReceiptListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReceiptListResponse _$ReceiptListResponseFromJson(Map<String, dynamic> json) {
  return _ReceiptListResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptListResponse {
  String get status => throw _privateConstructorUsedError;
  List<ReceiptListItem> get data => throw _privateConstructorUsedError;

  /// Serializes this ReceiptListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptListResponseCopyWith<ReceiptListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptListResponseCopyWith<$Res> {
  factory $ReceiptListResponseCopyWith(
          ReceiptListResponse value, $Res Function(ReceiptListResponse) then) =
      _$ReceiptListResponseCopyWithImpl<$Res, ReceiptListResponse>;
  @useResult
  $Res call({String status, List<ReceiptListItem> data});
}

/// @nodoc
class _$ReceiptListResponseCopyWithImpl<$Res, $Val extends ReceiptListResponse>
    implements $ReceiptListResponseCopyWith<$Res> {
  _$ReceiptListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReceiptListItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptListResponseImplCopyWith<$Res>
    implements $ReceiptListResponseCopyWith<$Res> {
  factory _$$ReceiptListResponseImplCopyWith(_$ReceiptListResponseImpl value,
          $Res Function(_$ReceiptListResponseImpl) then) =
      __$$ReceiptListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, List<ReceiptListItem> data});
}

/// @nodoc
class __$$ReceiptListResponseImplCopyWithImpl<$Res>
    extends _$ReceiptListResponseCopyWithImpl<$Res, _$ReceiptListResponseImpl>
    implements _$$ReceiptListResponseImplCopyWith<$Res> {
  __$$ReceiptListResponseImplCopyWithImpl(_$ReceiptListResponseImpl _value,
      $Res Function(_$ReceiptListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$ReceiptListResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReceiptListItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptListResponseImpl implements _ReceiptListResponse {
  const _$ReceiptListResponseImpl(
      {required this.status, required final List<ReceiptListItem> data})
      : _data = data;

  factory _$ReceiptListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptListResponseImplFromJson(json);

  @override
  final String status;
  final List<ReceiptListItem> _data;
  @override
  List<ReceiptListItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ReceiptListResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptListResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ReceiptListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptListResponseImplCopyWith<_$ReceiptListResponseImpl> get copyWith =>
      __$$ReceiptListResponseImplCopyWithImpl<_$ReceiptListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptListResponseImplToJson(
      this,
    );
  }
}

abstract class _ReceiptListResponse implements ReceiptListResponse {
  const factory _ReceiptListResponse(
      {required final String status,
      required final List<ReceiptListItem> data}) = _$ReceiptListResponseImpl;

  factory _ReceiptListResponse.fromJson(Map<String, dynamic> json) =
      _$ReceiptListResponseImpl.fromJson;

  @override
  String get status;
  @override
  List<ReceiptListItem> get data;

  /// Create a copy of ReceiptListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptListResponseImplCopyWith<_$ReceiptListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReceiptDetail _$ReceiptDetailFromJson(Map<String, dynamic> json) {
  return _ReceiptDetail.fromJson(json);
}

/// @nodoc
mixin _$ReceiptDetail {
  @JsonKey(name: 'user_product_id')
  int get userProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mall_name')
  String? get mallName => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_img')
  String? get productImg => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_rate')
  double? get discountRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'saved_amount')
  int? get savedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_days')
  int? get durationDays => throw _privateConstructorUsedError;

  /// Serializes this ReceiptDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptDetailCopyWith<ReceiptDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptDetailCopyWith<$Res> {
  factory $ReceiptDetailCopyWith(
          ReceiptDetail value, $Res Function(ReceiptDetail) then) =
      _$ReceiptDetailCopyWithImpl<$Res, ReceiptDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'mall_name') String? mallName,
      String? brand,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'discount_rate') double? discountRate,
      @JsonKey(name: 'saved_amount') int? savedAmount,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'duration_days') int? durationDays});
}

/// @nodoc
class _$ReceiptDetailCopyWithImpl<$Res, $Val extends ReceiptDetail>
    implements $ReceiptDetailCopyWith<$Res> {
  _$ReceiptDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? mallName = freezed,
    Object? brand = freezed,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? discountRate = freezed,
    Object? savedAmount = freezed,
    Object? completedAt = freezed,
    Object? durationDays = freezed,
  }) {
    return _then(_value.copyWith(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      mallName: freezed == mallName
          ? _value.mallName
          : mallName // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImg: freezed == productImg
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as double?,
      savedAmount: freezed == savedAmount
          ? _value.savedAmount
          : savedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      durationDays: freezed == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptDetailImplCopyWith<$Res>
    implements $ReceiptDetailCopyWith<$Res> {
  factory _$$ReceiptDetailImplCopyWith(
          _$ReceiptDetailImpl value, $Res Function(_$ReceiptDetailImpl) then) =
      __$$ReceiptDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'mall_name') String? mallName,
      String? brand,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'discount_rate') double? discountRate,
      @JsonKey(name: 'saved_amount') int? savedAmount,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'duration_days') int? durationDays});
}

/// @nodoc
class __$$ReceiptDetailImplCopyWithImpl<$Res>
    extends _$ReceiptDetailCopyWithImpl<$Res, _$ReceiptDetailImpl>
    implements _$$ReceiptDetailImplCopyWith<$Res> {
  __$$ReceiptDetailImplCopyWithImpl(
      _$ReceiptDetailImpl _value, $Res Function(_$ReceiptDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? mallName = freezed,
    Object? brand = freezed,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? discountRate = freezed,
    Object? savedAmount = freezed,
    Object? completedAt = freezed,
    Object? durationDays = freezed,
  }) {
    return _then(_$ReceiptDetailImpl(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      mallName: freezed == mallName
          ? _value.mallName
          : mallName // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productImg: freezed == productImg
          ? _value.productImg
          : productImg // ignore: cast_nullable_to_non_nullable
              as String?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountRate: freezed == discountRate
          ? _value.discountRate
          : discountRate // ignore: cast_nullable_to_non_nullable
              as double?,
      savedAmount: freezed == savedAmount
          ? _value.savedAmount
          : savedAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      durationDays: freezed == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptDetailImpl implements _ReceiptDetail {
  const _$ReceiptDetailImpl(
      {@JsonKey(name: 'user_product_id') required this.userProductId,
      @JsonKey(name: 'mall_name') this.mallName,
      this.brand,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_img') this.productImg,
      required this.price,
      @JsonKey(name: 'discount_rate') this.discountRate,
      @JsonKey(name: 'saved_amount') this.savedAmount,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'duration_days') this.durationDays});

  factory _$ReceiptDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptDetailImplFromJson(json);

  @override
  @JsonKey(name: 'user_product_id')
  final int userProductId;
  @override
  @JsonKey(name: 'mall_name')
  final String? mallName;
  @override
  final String? brand;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_img')
  final String? productImg;
  @override
  final int price;
  @override
  @JsonKey(name: 'discount_rate')
  final double? discountRate;
  @override
  @JsonKey(name: 'saved_amount')
  final int? savedAmount;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  @JsonKey(name: 'duration_days')
  final int? durationDays;

  @override
  String toString() {
    return 'ReceiptDetail(userProductId: $userProductId, mallName: $mallName, brand: $brand, productName: $productName, productImg: $productImg, price: $price, discountRate: $discountRate, savedAmount: $savedAmount, completedAt: $completedAt, durationDays: $durationDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptDetailImpl &&
            (identical(other.userProductId, userProductId) ||
                other.userProductId == userProductId) &&
            (identical(other.mallName, mallName) ||
                other.mallName == mallName) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImg, productImg) ||
                other.productImg == productImg) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountRate, discountRate) ||
                other.discountRate == discountRate) &&
            (identical(other.savedAmount, savedAmount) ||
                other.savedAmount == savedAmount) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProductId,
      mallName,
      brand,
      productName,
      productImg,
      price,
      discountRate,
      savedAmount,
      completedAt,
      durationDays);

  /// Create a copy of ReceiptDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptDetailImplCopyWith<_$ReceiptDetailImpl> get copyWith =>
      __$$ReceiptDetailImplCopyWithImpl<_$ReceiptDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptDetailImplToJson(
      this,
    );
  }
}

abstract class _ReceiptDetail implements ReceiptDetail {
  const factory _ReceiptDetail(
          {@JsonKey(name: 'user_product_id') required final int userProductId,
          @JsonKey(name: 'mall_name') final String? mallName,
          final String? brand,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'product_img') final String? productImg,
          required final int price,
          @JsonKey(name: 'discount_rate') final double? discountRate,
          @JsonKey(name: 'saved_amount') final int? savedAmount,
          @JsonKey(name: 'completed_at') final String? completedAt,
          @JsonKey(name: 'duration_days') final int? durationDays}) =
      _$ReceiptDetailImpl;

  factory _ReceiptDetail.fromJson(Map<String, dynamic> json) =
      _$ReceiptDetailImpl.fromJson;

  @override
  @JsonKey(name: 'user_product_id')
  int get userProductId;
  @override
  @JsonKey(name: 'mall_name')
  String? get mallName;
  @override
  String? get brand;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_img')
  String? get productImg;
  @override
  int get price;
  @override
  @JsonKey(name: 'discount_rate')
  double? get discountRate;
  @override
  @JsonKey(name: 'saved_amount')
  int? get savedAmount;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  @JsonKey(name: 'duration_days')
  int? get durationDays;

  /// Create a copy of ReceiptDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptDetailImplCopyWith<_$ReceiptDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReceiptDetailResponse _$ReceiptDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _ReceiptDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptDetailResponse {
  String get status => throw _privateConstructorUsedError;
  ReceiptDetail get data => throw _privateConstructorUsedError;

  /// Serializes this ReceiptDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptDetailResponseCopyWith<ReceiptDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptDetailResponseCopyWith<$Res> {
  factory $ReceiptDetailResponseCopyWith(ReceiptDetailResponse value,
          $Res Function(ReceiptDetailResponse) then) =
      _$ReceiptDetailResponseCopyWithImpl<$Res, ReceiptDetailResponse>;
  @useResult
  $Res call({String status, ReceiptDetail data});

  $ReceiptDetailCopyWith<$Res> get data;
}

/// @nodoc
class _$ReceiptDetailResponseCopyWithImpl<$Res,
        $Val extends ReceiptDetailResponse>
    implements $ReceiptDetailResponseCopyWith<$Res> {
  _$ReceiptDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReceiptDetail,
    ) as $Val);
  }

  /// Create a copy of ReceiptDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptDetailCopyWith<$Res> get data {
    return $ReceiptDetailCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReceiptDetailResponseImplCopyWith<$Res>
    implements $ReceiptDetailResponseCopyWith<$Res> {
  factory _$$ReceiptDetailResponseImplCopyWith(
          _$ReceiptDetailResponseImpl value,
          $Res Function(_$ReceiptDetailResponseImpl) then) =
      __$$ReceiptDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, ReceiptDetail data});

  @override
  $ReceiptDetailCopyWith<$Res> get data;
}

/// @nodoc
class __$$ReceiptDetailResponseImplCopyWithImpl<$Res>
    extends _$ReceiptDetailResponseCopyWithImpl<$Res,
        _$ReceiptDetailResponseImpl>
    implements _$$ReceiptDetailResponseImplCopyWith<$Res> {
  __$$ReceiptDetailResponseImplCopyWithImpl(_$ReceiptDetailResponseImpl _value,
      $Res Function(_$ReceiptDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
  }) {
    return _then(_$ReceiptDetailResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReceiptDetail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptDetailResponseImpl implements _ReceiptDetailResponse {
  const _$ReceiptDetailResponseImpl({required this.status, required this.data});

  factory _$ReceiptDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptDetailResponseImplFromJson(json);

  @override
  final String status;
  @override
  final ReceiptDetail data;

  @override
  String toString() {
    return 'ReceiptDetailResponse(status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptDetailResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, data);

  /// Create a copy of ReceiptDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptDetailResponseImplCopyWith<_$ReceiptDetailResponseImpl>
      get copyWith => __$$ReceiptDetailResponseImplCopyWithImpl<
          _$ReceiptDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _ReceiptDetailResponse implements ReceiptDetailResponse {
  const factory _ReceiptDetailResponse(
      {required final String status,
      required final ReceiptDetail data}) = _$ReceiptDetailResponseImpl;

  factory _ReceiptDetailResponse.fromJson(Map<String, dynamic> json) =
      _$ReceiptDetailResponseImpl.fromJson;

  @override
  String get status;
  @override
  ReceiptDetail get data;

  /// Create a copy of ReceiptDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptDetailResponseImplCopyWith<_$ReceiptDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
