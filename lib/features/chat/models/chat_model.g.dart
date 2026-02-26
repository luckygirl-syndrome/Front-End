// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatListItemImpl _$$ChatListItemImplFromJson(Map<String, dynamic> json) =>
    _$ChatListItemImpl(
      userProductId: (json['user_product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productImg: json['product_img'] as String?,
      price: (json['price'] as num).toInt(),
      lastChatTime: json['last_chat_time'] as String,
      statusLabel: json['status_label'] as String,
      isPurchased: (json['is_purchased'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChatListItemImplToJson(_$ChatListItemImpl instance) =>
    <String, dynamic>{
      'user_product_id': instance.userProductId,
      'product_name': instance.productName,
      'product_img': instance.productImg,
      'price': instance.price,
      'last_chat_time': instance.lastChatTime,
      'status_label': instance.statusLabel,
      'is_purchased': instance.isPurchased,
    };

_$ChatListResponseImpl _$$ChatListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatListResponseImpl(
      latestChat: json['latest_chat'] == null
          ? null
          : ChatListItem.fromJson(json['latest_chat'] as Map<String, dynamic>),
      allChats: (json['all_chats'] as List<dynamic>)
          .map((e) => ChatListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatListResponseImplToJson(
        _$ChatListResponseImpl instance) =>
    <String, dynamic>{
      'latest_chat': instance.latestChat,
      'all_chats': instance.allChats,
    };

_$ChatMessageResponseImpl _$$ChatMessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageResponseImpl(
      role: json['role'] as String?,
      message: json['message'] as String,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ChatMessageResponseImplToJson(
        _$ChatMessageResponseImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'message': instance.message,
      'content': instance.content,
      'created_at': instance.createdAt,
    };

_$ChatReplyImpl _$$ChatReplyImplFromJson(Map<String, dynamic> json) =>
    _$ChatReplyImpl(
      userProductId: (json['user_product_id'] as num).toInt(),
      reply: json['reply'] as String?,
      isExit: json['is_exit'] as bool? ?? false,
      finalScore: (json['final_score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChatReplyImplToJson(_$ChatReplyImpl instance) =>
    <String, dynamic>{
      'user_product_id': instance.userProductId,
      'reply': instance.reply,
      'is_exit': instance.isExit,
      'final_score': instance.finalScore,
    };

_$ChatRoomDetailResponseImpl _$$ChatRoomDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRoomDetailResponseImpl(
      userProductId: (json['user_product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productImg: json['product_img'] as String?,
      price: (json['price'] as num).toInt(),
      platform: json['platform'] as String?,
      productUrl: json['product_url'] as String?,
      statusLabel: json['status_label'] as String,
      status: json['status'] as String?,
      isPurchased: (json['is_purchased'] as num?)?.toInt(),
      isEvaluated: json['is_evaluated'] as bool?,
      finalScore: (json['final_score'] as num?)?.toInt(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatRoomDetailResponseImplToJson(
        _$ChatRoomDetailResponseImpl instance) =>
    <String, dynamic>{
      'user_product_id': instance.userProductId,
      'product_name': instance.productName,
      'product_img': instance.productImg,
      'price': instance.price,
      'platform': instance.platform,
      'product_url': instance.productUrl,
      'status_label': instance.statusLabel,
      'status': instance.status,
      'is_purchased': instance.isPurchased,
      'is_evaluated': instance.isEvaluated,
      'final_score': instance.finalScore,
      'messages': instance.messages,
    };
