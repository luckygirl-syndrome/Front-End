import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatListItem with _$ChatListItem {
  const factory ChatListItem({
    @JsonKey(name: 'user_product_id') required int userProductId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_img') String? productImg,
    required int price,
    @JsonKey(name: 'last_chat_time') required String lastChatTime,
    @JsonKey(name: 'status_label') required String statusLabel,
    @JsonKey(name: 'is_purchased') int? isPurchased,
  }) = _ChatListItem;

  factory ChatListItem.fromJson(Map<String, dynamic> json) =>
      _$ChatListItemFromJson(json);
}

@freezed
class ChatListResponse with _$ChatListResponse {
  const factory ChatListResponse({
    @JsonKey(name: 'latest_chat') ChatListItem? latestChat,
    @JsonKey(name: 'all_chats') required List<ChatListItem> allChats,
  }) = _ChatListResponse;

  factory ChatListResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatListResponseFromJson(json);
}

@freezed
class ChatMessageResponse with _$ChatMessageResponse {
  const factory ChatMessageResponse({
    required String? role,
    required String message,
    String? content,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ChatMessageResponse;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseFromJson(json);
}

@freezed
class ChatReply with _$ChatReply {
  const factory ChatReply({
    @JsonKey(name: 'user_product_id') required int userProductId,
    String? reply,
    @JsonKey(name: 'is_exit') @Default(false) bool? isExit,
    @JsonKey(name: 'final_score') int? finalScore,
  }) = _ChatReply;

  factory ChatReply.fromJson(Map<String, dynamic> json) =>
      _$ChatReplyFromJson(json);
}

@freezed
class ChatRoomDetailResponse with _$ChatRoomDetailResponse {
  const factory ChatRoomDetailResponse({
    @JsonKey(name: 'user_product_id') required int userProductId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_img') String? productImg,
    required int price,
    String? platform, // 무신사, 지그재그, 에이블리 등 (크롤링에서 저장)
    @JsonKey(name: 'product_url') String? productUrl, // 쇼핑몰 상품 링크 (상단 shop 아이콘용)
    @JsonKey(name: 'status_label') required String statusLabel,
    String? status, // ANALYZING, PENDING, FINISHED (exit 호출 시 FINISHED → 종료 배너)
    @JsonKey(name: 'is_purchased') int? isPurchased,
    @JsonKey(name: 'is_evaluated') bool? isEvaluated,
    @JsonKey(name: 'final_score') int? finalScore,
    required List<ChatMessageResponse> messages,
  }) = _ChatRoomDetailResponse;

  factory ChatRoomDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomDetailResponseFromJson(json);
}
