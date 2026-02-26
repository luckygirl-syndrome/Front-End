// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatListItem _$ChatListItemFromJson(Map<String, dynamic> json) {
  return _ChatListItem.fromJson(json);
}

/// @nodoc
mixin _$ChatListItem {
  @JsonKey(name: 'user_product_id')
  int get userProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_img')
  String? get productImg => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_chat_time')
  String get lastChatTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_label')
  String get statusLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_purchased')
  int? get isPurchased => throw _privateConstructorUsedError;

  /// Serializes this ChatListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatListItemCopyWith<ChatListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListItemCopyWith<$Res> {
  factory $ChatListItemCopyWith(
          ChatListItem value, $Res Function(ChatListItem) then) =
      _$ChatListItemCopyWithImpl<$Res, ChatListItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'last_chat_time') String lastChatTime,
      @JsonKey(name: 'status_label') String statusLabel,
      @JsonKey(name: 'is_purchased') int? isPurchased});
}

/// @nodoc
class _$ChatListItemCopyWithImpl<$Res, $Val extends ChatListItem>
    implements $ChatListItemCopyWith<$Res> {
  _$ChatListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? lastChatTime = null,
    Object? statusLabel = null,
    Object? isPurchased = freezed,
  }) {
    return _then(_value.copyWith(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
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
      lastChatTime: null == lastChatTime
          ? _value.lastChatTime
          : lastChatTime // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      isPurchased: freezed == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatListItemImplCopyWith<$Res>
    implements $ChatListItemCopyWith<$Res> {
  factory _$$ChatListItemImplCopyWith(
          _$ChatListItemImpl value, $Res Function(_$ChatListItemImpl) then) =
      __$$ChatListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      @JsonKey(name: 'last_chat_time') String lastChatTime,
      @JsonKey(name: 'status_label') String statusLabel,
      @JsonKey(name: 'is_purchased') int? isPurchased});
}

/// @nodoc
class __$$ChatListItemImplCopyWithImpl<$Res>
    extends _$ChatListItemCopyWithImpl<$Res, _$ChatListItemImpl>
    implements _$$ChatListItemImplCopyWith<$Res> {
  __$$ChatListItemImplCopyWithImpl(
      _$ChatListItemImpl _value, $Res Function(_$ChatListItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? lastChatTime = null,
    Object? statusLabel = null,
    Object? isPurchased = freezed,
  }) {
    return _then(_$ChatListItemImpl(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
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
      lastChatTime: null == lastChatTime
          ? _value.lastChatTime
          : lastChatTime // ignore: cast_nullable_to_non_nullable
              as String,
      statusLabel: null == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      isPurchased: freezed == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatListItemImpl implements _ChatListItem {
  const _$ChatListItemImpl(
      {@JsonKey(name: 'user_product_id') required this.userProductId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_img') this.productImg,
      required this.price,
      @JsonKey(name: 'last_chat_time') required this.lastChatTime,
      @JsonKey(name: 'status_label') required this.statusLabel,
      @JsonKey(name: 'is_purchased') this.isPurchased});

  factory _$ChatListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListItemImplFromJson(json);

  @override
  @JsonKey(name: 'user_product_id')
  final int userProductId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_img')
  final String? productImg;
  @override
  final int price;
  @override
  @JsonKey(name: 'last_chat_time')
  final String lastChatTime;
  @override
  @JsonKey(name: 'status_label')
  final String statusLabel;
  @override
  @JsonKey(name: 'is_purchased')
  final int? isPurchased;

  @override
  String toString() {
    return 'ChatListItem(userProductId: $userProductId, productName: $productName, productImg: $productImg, price: $price, lastChatTime: $lastChatTime, statusLabel: $statusLabel, isPurchased: $isPurchased)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListItemImpl &&
            (identical(other.userProductId, userProductId) ||
                other.userProductId == userProductId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImg, productImg) ||
                other.productImg == productImg) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.lastChatTime, lastChatTime) ||
                other.lastChatTime == lastChatTime) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userProductId, productName,
      productImg, price, lastChatTime, statusLabel, isPurchased);

  /// Create a copy of ChatListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListItemImplCopyWith<_$ChatListItemImpl> get copyWith =>
      __$$ChatListItemImplCopyWithImpl<_$ChatListItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListItemImplToJson(
      this,
    );
  }
}

abstract class _ChatListItem implements ChatListItem {
  const factory _ChatListItem(
          {@JsonKey(name: 'user_product_id') required final int userProductId,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'product_img') final String? productImg,
          required final int price,
          @JsonKey(name: 'last_chat_time') required final String lastChatTime,
          @JsonKey(name: 'status_label') required final String statusLabel,
          @JsonKey(name: 'is_purchased') final int? isPurchased}) =
      _$ChatListItemImpl;

  factory _ChatListItem.fromJson(Map<String, dynamic> json) =
      _$ChatListItemImpl.fromJson;

  @override
  @JsonKey(name: 'user_product_id')
  int get userProductId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_img')
  String? get productImg;
  @override
  int get price;
  @override
  @JsonKey(name: 'last_chat_time')
  String get lastChatTime;
  @override
  @JsonKey(name: 'status_label')
  String get statusLabel;
  @override
  @JsonKey(name: 'is_purchased')
  int? get isPurchased;

  /// Create a copy of ChatListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatListItemImplCopyWith<_$ChatListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatListResponse _$ChatListResponseFromJson(Map<String, dynamic> json) {
  return _ChatListResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatListResponse {
  @JsonKey(name: 'latest_chat')
  ChatListItem? get latestChat => throw _privateConstructorUsedError;
  @JsonKey(name: 'all_chats')
  List<ChatListItem> get allChats => throw _privateConstructorUsedError;

  /// Serializes this ChatListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatListResponseCopyWith<ChatListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListResponseCopyWith<$Res> {
  factory $ChatListResponseCopyWith(
          ChatListResponse value, $Res Function(ChatListResponse) then) =
      _$ChatListResponseCopyWithImpl<$Res, ChatListResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'latest_chat') ChatListItem? latestChat,
      @JsonKey(name: 'all_chats') List<ChatListItem> allChats});

  $ChatListItemCopyWith<$Res>? get latestChat;
}

/// @nodoc
class _$ChatListResponseCopyWithImpl<$Res, $Val extends ChatListResponse>
    implements $ChatListResponseCopyWith<$Res> {
  _$ChatListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestChat = freezed,
    Object? allChats = null,
  }) {
    return _then(_value.copyWith(
      latestChat: freezed == latestChat
          ? _value.latestChat
          : latestChat // ignore: cast_nullable_to_non_nullable
              as ChatListItem?,
      allChats: null == allChats
          ? _value.allChats
          : allChats // ignore: cast_nullable_to_non_nullable
              as List<ChatListItem>,
    ) as $Val);
  }

  /// Create a copy of ChatListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatListItemCopyWith<$Res>? get latestChat {
    if (_value.latestChat == null) {
      return null;
    }

    return $ChatListItemCopyWith<$Res>(_value.latestChat!, (value) {
      return _then(_value.copyWith(latestChat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatListResponseImplCopyWith<$Res>
    implements $ChatListResponseCopyWith<$Res> {
  factory _$$ChatListResponseImplCopyWith(_$ChatListResponseImpl value,
          $Res Function(_$ChatListResponseImpl) then) =
      __$$ChatListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'latest_chat') ChatListItem? latestChat,
      @JsonKey(name: 'all_chats') List<ChatListItem> allChats});

  @override
  $ChatListItemCopyWith<$Res>? get latestChat;
}

/// @nodoc
class __$$ChatListResponseImplCopyWithImpl<$Res>
    extends _$ChatListResponseCopyWithImpl<$Res, _$ChatListResponseImpl>
    implements _$$ChatListResponseImplCopyWith<$Res> {
  __$$ChatListResponseImplCopyWithImpl(_$ChatListResponseImpl _value,
      $Res Function(_$ChatListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestChat = freezed,
    Object? allChats = null,
  }) {
    return _then(_$ChatListResponseImpl(
      latestChat: freezed == latestChat
          ? _value.latestChat
          : latestChat // ignore: cast_nullable_to_non_nullable
              as ChatListItem?,
      allChats: null == allChats
          ? _value._allChats
          : allChats // ignore: cast_nullable_to_non_nullable
              as List<ChatListItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatListResponseImpl implements _ChatListResponse {
  const _$ChatListResponseImpl(
      {@JsonKey(name: 'latest_chat') this.latestChat,
      @JsonKey(name: 'all_chats') required final List<ChatListItem> allChats})
      : _allChats = allChats;

  factory _$ChatListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListResponseImplFromJson(json);

  @override
  @JsonKey(name: 'latest_chat')
  final ChatListItem? latestChat;
  final List<ChatListItem> _allChats;
  @override
  @JsonKey(name: 'all_chats')
  List<ChatListItem> get allChats {
    if (_allChats is EqualUnmodifiableListView) return _allChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allChats);
  }

  @override
  String toString() {
    return 'ChatListResponse(latestChat: $latestChat, allChats: $allChats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListResponseImpl &&
            (identical(other.latestChat, latestChat) ||
                other.latestChat == latestChat) &&
            const DeepCollectionEquality().equals(other._allChats, _allChats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, latestChat, const DeepCollectionEquality().hash(_allChats));

  /// Create a copy of ChatListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListResponseImplCopyWith<_$ChatListResponseImpl> get copyWith =>
      __$$ChatListResponseImplCopyWithImpl<_$ChatListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatListResponse implements ChatListResponse {
  const factory _ChatListResponse(
      {@JsonKey(name: 'latest_chat') final ChatListItem? latestChat,
      @JsonKey(name: 'all_chats')
      required final List<ChatListItem> allChats}) = _$ChatListResponseImpl;

  factory _ChatListResponse.fromJson(Map<String, dynamic> json) =
      _$ChatListResponseImpl.fromJson;

  @override
  @JsonKey(name: 'latest_chat')
  ChatListItem? get latestChat;
  @override
  @JsonKey(name: 'all_chats')
  List<ChatListItem> get allChats;

  /// Create a copy of ChatListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatListResponseImplCopyWith<_$ChatListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessageResponse _$ChatMessageResponseFromJson(Map<String, dynamic> json) {
  return _ChatMessageResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageResponse {
  String? get role => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageResponseCopyWith<ChatMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageResponseCopyWith<$Res> {
  factory $ChatMessageResponseCopyWith(
          ChatMessageResponse value, $Res Function(ChatMessageResponse) then) =
      _$ChatMessageResponseCopyWithImpl<$Res, ChatMessageResponse>;
  @useResult
  $Res call(
      {String? role,
      String message,
      String? content,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class _$ChatMessageResponseCopyWithImpl<$Res, $Val extends ChatMessageResponse>
    implements $ChatMessageResponseCopyWith<$Res> {
  _$ChatMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? message = null,
    Object? content = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageResponseImplCopyWith<$Res>
    implements $ChatMessageResponseCopyWith<$Res> {
  factory _$$ChatMessageResponseImplCopyWith(_$ChatMessageResponseImpl value,
          $Res Function(_$ChatMessageResponseImpl) then) =
      __$$ChatMessageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? role,
      String message,
      String? content,
      @JsonKey(name: 'created_at') String? createdAt});
}

/// @nodoc
class __$$ChatMessageResponseImplCopyWithImpl<$Res>
    extends _$ChatMessageResponseCopyWithImpl<$Res, _$ChatMessageResponseImpl>
    implements _$$ChatMessageResponseImplCopyWith<$Res> {
  __$$ChatMessageResponseImplCopyWithImpl(_$ChatMessageResponseImpl _value,
      $Res Function(_$ChatMessageResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? message = null,
    Object? content = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ChatMessageResponseImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageResponseImpl implements _ChatMessageResponse {
  const _$ChatMessageResponseImpl(
      {required this.role,
      required this.message,
      this.content,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$ChatMessageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageResponseImplFromJson(json);

  @override
  final String? role;
  @override
  final String message;
  @override
  final String? content;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'ChatMessageResponse(role: $role, message: $message, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageResponseImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, role, message, content, createdAt);

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      __$$ChatMessageResponseImplCopyWithImpl<_$ChatMessageResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageResponse implements ChatMessageResponse {
  const factory _ChatMessageResponse(
          {required final String? role,
          required final String message,
          final String? content,
          @JsonKey(name: 'created_at') final String? createdAt}) =
      _$ChatMessageResponseImpl;

  factory _ChatMessageResponse.fromJson(Map<String, dynamic> json) =
      _$ChatMessageResponseImpl.fromJson;

  @override
  String? get role;
  @override
  String get message;
  @override
  String? get content;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;

  /// Create a copy of ChatMessageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageResponseImplCopyWith<_$ChatMessageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatReply _$ChatReplyFromJson(Map<String, dynamic> json) {
  return _ChatReply.fromJson(json);
}

/// @nodoc
mixin _$ChatReply {
  @JsonKey(name: 'user_product_id')
  int get userProductId => throw _privateConstructorUsedError;
  String? get reply => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_exit')
  bool? get isExit => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_score')
  int? get finalScore => throw _privateConstructorUsedError;

  /// Serializes this ChatReply to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatReplyCopyWith<ChatReply> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatReplyCopyWith<$Res> {
  factory $ChatReplyCopyWith(ChatReply value, $Res Function(ChatReply) then) =
      _$ChatReplyCopyWithImpl<$Res, ChatReply>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      String? reply,
      @JsonKey(name: 'is_exit') bool? isExit,
      @JsonKey(name: 'final_score') int? finalScore});
}

/// @nodoc
class _$ChatReplyCopyWithImpl<$Res, $Val extends ChatReply>
    implements $ChatReplyCopyWith<$Res> {
  _$ChatReplyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? reply = freezed,
    Object? isExit = freezed,
    Object? finalScore = freezed,
  }) {
    return _then(_value.copyWith(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
      isExit: freezed == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool?,
      finalScore: freezed == finalScore
          ? _value.finalScore
          : finalScore // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatReplyImplCopyWith<$Res>
    implements $ChatReplyCopyWith<$Res> {
  factory _$$ChatReplyImplCopyWith(
          _$ChatReplyImpl value, $Res Function(_$ChatReplyImpl) then) =
      __$$ChatReplyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      String? reply,
      @JsonKey(name: 'is_exit') bool? isExit,
      @JsonKey(name: 'final_score') int? finalScore});
}

/// @nodoc
class __$$ChatReplyImplCopyWithImpl<$Res>
    extends _$ChatReplyCopyWithImpl<$Res, _$ChatReplyImpl>
    implements _$$ChatReplyImplCopyWith<$Res> {
  __$$ChatReplyImplCopyWithImpl(
      _$ChatReplyImpl _value, $Res Function(_$ChatReplyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatReply
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? reply = freezed,
    Object? isExit = freezed,
    Object? finalScore = freezed,
  }) {
    return _then(_$ChatReplyImpl(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
              as int,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String?,
      isExit: freezed == isExit
          ? _value.isExit
          : isExit // ignore: cast_nullable_to_non_nullable
              as bool?,
      finalScore: freezed == finalScore
          ? _value.finalScore
          : finalScore // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatReplyImpl implements _ChatReply {
  const _$ChatReplyImpl(
      {@JsonKey(name: 'user_product_id') required this.userProductId,
      this.reply,
      @JsonKey(name: 'is_exit') this.isExit = false,
      @JsonKey(name: 'final_score') this.finalScore});

  factory _$ChatReplyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatReplyImplFromJson(json);

  @override
  @JsonKey(name: 'user_product_id')
  final int userProductId;
  @override
  final String? reply;
  @override
  @JsonKey(name: 'is_exit')
  final bool? isExit;
  @override
  @JsonKey(name: 'final_score')
  final int? finalScore;

  @override
  String toString() {
    return 'ChatReply(userProductId: $userProductId, reply: $reply, isExit: $isExit, finalScore: $finalScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatReplyImpl &&
            (identical(other.userProductId, userProductId) ||
                other.userProductId == userProductId) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.isExit, isExit) || other.isExit == isExit) &&
            (identical(other.finalScore, finalScore) ||
                other.finalScore == finalScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userProductId, reply, isExit, finalScore);

  /// Create a copy of ChatReply
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatReplyImplCopyWith<_$ChatReplyImpl> get copyWith =>
      __$$ChatReplyImplCopyWithImpl<_$ChatReplyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatReplyImplToJson(
      this,
    );
  }
}

abstract class _ChatReply implements ChatReply {
  const factory _ChatReply(
      {@JsonKey(name: 'user_product_id') required final int userProductId,
      final String? reply,
      @JsonKey(name: 'is_exit') final bool? isExit,
      @JsonKey(name: 'final_score') final int? finalScore}) = _$ChatReplyImpl;

  factory _ChatReply.fromJson(Map<String, dynamic> json) =
      _$ChatReplyImpl.fromJson;

  @override
  @JsonKey(name: 'user_product_id')
  int get userProductId;
  @override
  String? get reply;
  @override
  @JsonKey(name: 'is_exit')
  bool? get isExit;
  @override
  @JsonKey(name: 'final_score')
  int? get finalScore;

  /// Create a copy of ChatReply
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatReplyImplCopyWith<_$ChatReplyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatRoomDetailResponse _$ChatRoomDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatRoomDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomDetailResponse {
  @JsonKey(name: 'user_product_id')
  int get userProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_img')
  String? get productImg => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String? get platform =>
      throw _privateConstructorUsedError; // 무신사, 지그재그, 에이블리 등 (크롤링에서 저장)
  @JsonKey(name: 'product_url')
  String? get productUrl =>
      throw _privateConstructorUsedError; // 쇼핑몰 상품 링크 (상단 shop 아이콘용)
  @JsonKey(name: 'status_label')
  String get statusLabel => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // ANALYZING, PENDING, FINISHED (exit 호출 시 FINISHED → 종료 배너)
  @JsonKey(name: 'is_purchased')
  int? get isPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_evaluated')
  bool? get isEvaluated => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_score')
  int? get finalScore => throw _privateConstructorUsedError;
  List<ChatMessageResponse> get messages => throw _privateConstructorUsedError;

  /// Serializes this ChatRoomDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoomDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomDetailResponseCopyWith<ChatRoomDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomDetailResponseCopyWith<$Res> {
  factory $ChatRoomDetailResponseCopyWith(ChatRoomDetailResponse value,
          $Res Function(ChatRoomDetailResponse) then) =
      _$ChatRoomDetailResponseCopyWithImpl<$Res, ChatRoomDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      String? platform,
      @JsonKey(name: 'product_url') String? productUrl,
      @JsonKey(name: 'status_label') String statusLabel,
      String? status,
      @JsonKey(name: 'is_purchased') int? isPurchased,
      @JsonKey(name: 'is_evaluated') bool? isEvaluated,
      @JsonKey(name: 'final_score') int? finalScore,
      List<ChatMessageResponse> messages});
}

/// @nodoc
class _$ChatRoomDetailResponseCopyWithImpl<$Res,
        $Val extends ChatRoomDetailResponse>
    implements $ChatRoomDetailResponseCopyWith<$Res> {
  _$ChatRoomDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? platform = freezed,
    Object? productUrl = freezed,
    Object? statusLabel = null,
    Object? status = freezed,
    Object? isPurchased = freezed,
    Object? isEvaluated = freezed,
    Object? finalScore = freezed,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
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
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      statusLabel: null == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPurchased: freezed == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as int?,
      isEvaluated: freezed == isEvaluated
          ? _value.isEvaluated
          : isEvaluated // ignore: cast_nullable_to_non_nullable
              as bool?,
      finalScore: freezed == finalScore
          ? _value.finalScore
          : finalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomDetailResponseImplCopyWith<$Res>
    implements $ChatRoomDetailResponseCopyWith<$Res> {
  factory _$$ChatRoomDetailResponseImplCopyWith(
          _$ChatRoomDetailResponseImpl value,
          $Res Function(_$ChatRoomDetailResponseImpl) then) =
      __$$ChatRoomDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_product_id') int userProductId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_img') String? productImg,
      int price,
      String? platform,
      @JsonKey(name: 'product_url') String? productUrl,
      @JsonKey(name: 'status_label') String statusLabel,
      String? status,
      @JsonKey(name: 'is_purchased') int? isPurchased,
      @JsonKey(name: 'is_evaluated') bool? isEvaluated,
      @JsonKey(name: 'final_score') int? finalScore,
      List<ChatMessageResponse> messages});
}

/// @nodoc
class __$$ChatRoomDetailResponseImplCopyWithImpl<$Res>
    extends _$ChatRoomDetailResponseCopyWithImpl<$Res,
        _$ChatRoomDetailResponseImpl>
    implements _$$ChatRoomDetailResponseImplCopyWith<$Res> {
  __$$ChatRoomDetailResponseImplCopyWithImpl(
      _$ChatRoomDetailResponseImpl _value,
      $Res Function(_$ChatRoomDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProductId = null,
    Object? productName = null,
    Object? productImg = freezed,
    Object? price = null,
    Object? platform = freezed,
    Object? productUrl = freezed,
    Object? statusLabel = null,
    Object? status = freezed,
    Object? isPurchased = freezed,
    Object? isEvaluated = freezed,
    Object? finalScore = freezed,
    Object? messages = null,
  }) {
    return _then(_$ChatRoomDetailResponseImpl(
      userProductId: null == userProductId
          ? _value.userProductId
          : userProductId // ignore: cast_nullable_to_non_nullable
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
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String?,
      productUrl: freezed == productUrl
          ? _value.productUrl
          : productUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      statusLabel: null == statusLabel
          ? _value.statusLabel
          : statusLabel // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isPurchased: freezed == isPurchased
          ? _value.isPurchased
          : isPurchased // ignore: cast_nullable_to_non_nullable
              as int?,
      isEvaluated: freezed == isEvaluated
          ? _value.isEvaluated
          : isEvaluated // ignore: cast_nullable_to_non_nullable
              as bool?,
      finalScore: freezed == finalScore
          ? _value.finalScore
          : finalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomDetailResponseImpl implements _ChatRoomDetailResponse {
  const _$ChatRoomDetailResponseImpl(
      {@JsonKey(name: 'user_product_id') required this.userProductId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_img') this.productImg,
      required this.price,
      this.platform,
      @JsonKey(name: 'product_url') this.productUrl,
      @JsonKey(name: 'status_label') required this.statusLabel,
      this.status,
      @JsonKey(name: 'is_purchased') this.isPurchased,
      @JsonKey(name: 'is_evaluated') this.isEvaluated,
      @JsonKey(name: 'final_score') this.finalScore,
      required final List<ChatMessageResponse> messages})
      : _messages = messages;

  factory _$ChatRoomDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomDetailResponseImplFromJson(json);

  @override
  @JsonKey(name: 'user_product_id')
  final int userProductId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_img')
  final String? productImg;
  @override
  final int price;
  @override
  final String? platform;
// 무신사, 지그재그, 에이블리 등 (크롤링에서 저장)
  @override
  @JsonKey(name: 'product_url')
  final String? productUrl;
// 쇼핑몰 상품 링크 (상단 shop 아이콘용)
  @override
  @JsonKey(name: 'status_label')
  final String statusLabel;
  @override
  final String? status;
// ANALYZING, PENDING, FINISHED (exit 호출 시 FINISHED → 종료 배너)
  @override
  @JsonKey(name: 'is_purchased')
  final int? isPurchased;
  @override
  @JsonKey(name: 'is_evaluated')
  final bool? isEvaluated;
  @override
  @JsonKey(name: 'final_score')
  final int? finalScore;
  final List<ChatMessageResponse> _messages;
  @override
  List<ChatMessageResponse> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatRoomDetailResponse(userProductId: $userProductId, productName: $productName, productImg: $productImg, price: $price, platform: $platform, productUrl: $productUrl, statusLabel: $statusLabel, status: $status, isPurchased: $isPurchased, isEvaluated: $isEvaluated, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomDetailResponseImpl &&
            (identical(other.userProductId, userProductId) ||
                other.userProductId == userProductId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productImg, productImg) ||
                other.productImg == productImg) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.productUrl, productUrl) ||
                other.productUrl == productUrl) &&
            (identical(other.statusLabel, statusLabel) ||
                other.statusLabel == statusLabel) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPurchased, isPurchased) ||
                other.isPurchased == isPurchased) &&
            (identical(other.isEvaluated, isEvaluated) ||
                other.isEvaluated == isEvaluated) &&
            (identical(other.finalScore, finalScore) ||
                other.finalScore == finalScore) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProductId,
      productName,
      productImg,
      price,
      platform,
      productUrl,
      statusLabel,
      status,
      isPurchased,
      isEvaluated,
      finalScore,
      const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatRoomDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomDetailResponseImplCopyWith<_$ChatRoomDetailResponseImpl>
      get copyWith => __$$ChatRoomDetailResponseImplCopyWithImpl<
          _$ChatRoomDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomDetailResponse implements ChatRoomDetailResponse {
  const factory _ChatRoomDetailResponse(
          {@JsonKey(name: 'user_product_id') required final int userProductId,
          @JsonKey(name: 'product_name') required final String productName,
          @JsonKey(name: 'product_img') final String? productImg,
          required final int price,
          final String? platform,
          @JsonKey(name: 'product_url') final String? productUrl,
          @JsonKey(name: 'status_label') required final String statusLabel,
          final String? status,
          @JsonKey(name: 'is_purchased') final int? isPurchased,
          @JsonKey(name: 'is_evaluated') final bool? isEvaluated,
          @JsonKey(name: 'final_score') final int? finalScore,
          required final List<ChatMessageResponse> messages}) =
      _$ChatRoomDetailResponseImpl;

  factory _ChatRoomDetailResponse.fromJson(Map<String, dynamic> json) =
      _$ChatRoomDetailResponseImpl.fromJson;

  @override
  @JsonKey(name: 'user_product_id')
  int get userProductId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_img')
  String? get productImg;
  @override
  int get price;
  @override
  String? get platform; // 무신사, 지그재그, 에이블리 등 (크롤링에서 저장)
  @override
  @JsonKey(name: 'product_url')
  String? get productUrl; // 쇼핑몰 상품 링크 (상단 shop 아이콘용)
  @override
  @JsonKey(name: 'status_label')
  String get statusLabel;
  @override
  String?
      get status; // ANALYZING, PENDING, FINISHED (exit 호출 시 FINISHED → 종료 배너)
  @override
  @JsonKey(name: 'is_purchased')
  int? get isPurchased;
  @override
  @JsonKey(name: 'is_evaluated')
  bool? get isEvaluated;
  @override
  @JsonKey(name: 'final_score')
  int? get finalScore;
  @override
  List<ChatMessageResponse> get messages;

  /// Create a copy of ChatRoomDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomDetailResponseImplCopyWith<_$ChatRoomDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
