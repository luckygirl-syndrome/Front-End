// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AxisScoreImpl _$$AxisScoreImplFromJson(Map<String, dynamic> json) =>
    _$AxisScoreImpl(
      result: json['result'] as String,
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$AxisScoreImplToJson(_$AxisScoreImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'score': instance.score,
    };

_$HomeDashboardDataImpl _$$HomeDashboardDataImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeDashboardDataImpl(
      userName: json['user_name'] as String,
      savedAmount: (json['saved_amount'] as num).toInt(),
      recentChatCount: (json['recent_chat_count'] as num).toInt(),
      totalChatCount: (json['total_chat_count'] as num).toInt(),
    );

Map<String, dynamic> _$$HomeDashboardDataImplToJson(
        _$HomeDashboardDataImpl instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'saved_amount': instance.savedAmount,
      'recent_chat_count': instance.recentChatCount,
      'total_chat_count': instance.totalChatCount,
    };

_$HomeDashboardResponseImpl _$$HomeDashboardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeDashboardResponseImpl(
      status: json['status'] as String,
      data: HomeDashboardData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomeDashboardResponseImplToJson(
        _$HomeDashboardResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$ConsideringListItemImpl _$$ConsideringListItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsideringListItemImpl(
      userProductId: (json['user_product_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productImg: json['product_img'] as String?,
      price: (json['price'] as num).toInt(),
      durationDays: (json['duration_days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ConsideringListItemImplToJson(
        _$ConsideringListItemImpl instance) =>
    <String, dynamic>{
      'user_product_id': instance.userProductId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_img': instance.productImg,
      'price': instance.price,
      'duration_days': instance.durationDays,
    };

_$ConsideringListResponseImpl _$$ConsideringListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsideringListResponseImpl(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ConsideringListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConsideringListResponseImplToJson(
        _$ConsideringListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$ReceiptListItemImpl _$$ReceiptListItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptListItemImpl(
      userProductId: (json['user_product_id'] as num).toInt(),
      productId: (json['product_id'] as num).toInt(),
      productName: json['product_name'] as String,
      productImg: json['product_img'] as String?,
      price: (json['price'] as num).toInt(),
      discountRate: (json['discount_rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ReceiptListItemImplToJson(
        _$ReceiptListItemImpl instance) =>
    <String, dynamic>{
      'user_product_id': instance.userProductId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_img': instance.productImg,
      'price': instance.price,
      'discount_rate': instance.discountRate,
    };

_$ReceiptListResponseImpl _$$ReceiptListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptListResponseImpl(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ReceiptListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReceiptListResponseImplToJson(
        _$ReceiptListResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$ReceiptDetailImpl _$$ReceiptDetailImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptDetailImpl(
      userProductId: (json['user_product_id'] as num).toInt(),
      mallName: json['mall_name'] as String?,
      brand: json['brand'] as String?,
      productName: json['product_name'] as String,
      productImg: json['product_img'] as String?,
      price: (json['price'] as num).toInt(),
      discountRate: (json['discount_rate'] as num?)?.toDouble(),
      savedAmount: (json['saved_amount'] as num?)?.toInt(),
      completedAt: json['completed_at'] as String?,
      durationDays: (json['duration_days'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ReceiptDetailImplToJson(_$ReceiptDetailImpl instance) =>
    <String, dynamic>{
      'user_product_id': instance.userProductId,
      'mall_name': instance.mallName,
      'brand': instance.brand,
      'product_name': instance.productName,
      'product_img': instance.productImg,
      'price': instance.price,
      'discount_rate': instance.discountRate,
      'saved_amount': instance.savedAmount,
      'completed_at': instance.completedAt,
      'duration_days': instance.durationDays,
    };

_$ReceiptDetailResponseImpl _$$ReceiptDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptDetailResponseImpl(
      status: json['status'] as String,
      data: ReceiptDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReceiptDetailResponseImplToJson(
        _$ReceiptDetailResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
