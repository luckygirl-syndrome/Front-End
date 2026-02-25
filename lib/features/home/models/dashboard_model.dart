import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class AxisScore with _$AxisScore {
  const factory AxisScore({
    required String result,
    required int score,
  }) = _AxisScore;

  factory AxisScore.fromJson(Map<String, dynamic> json) =>
      _$AxisScoreFromJson(json);
}

@freezed
class HomeDashboardData with _$HomeDashboardData {
  const factory HomeDashboardData({
    @JsonKey(name: 'user_name') required String userName,
    @JsonKey(name: 'saved_amount') required int savedAmount,
    @JsonKey(name: 'recent_chat_count') required int recentChatCount,
    @JsonKey(name: 'total_chat_count') required int totalChatCount,
  }) = _HomeDashboardData;

  factory HomeDashboardData.fromJson(Map<String, dynamic> json) =>
      _$HomeDashboardDataFromJson(json);
}

@freezed
class HomeDashboardResponse with _$HomeDashboardResponse {
  const factory HomeDashboardResponse({
    required String status,
    required HomeDashboardData data,
  }) = _HomeDashboardResponse;

  factory HomeDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDashboardResponseFromJson(json);
}

@freezed
class ConsideringListItem with _$ConsideringListItem {
  const factory ConsideringListItem({
    @JsonKey(name: 'user_product_id') required int userProductId,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_img') String? productImg,
    required int price,
    @JsonKey(name: 'duration_days') int? durationDays,
  }) = _ConsideringListItem;

  factory ConsideringListItem.fromJson(Map<String, dynamic> json) =>
      _$ConsideringListItemFromJson(json);
}

@freezed
class ConsideringListResponse with _$ConsideringListResponse {
  const factory ConsideringListResponse({
    required String status,
    required List<ConsideringListItem> data,
  }) = _ConsideringListResponse;

  factory ConsideringListResponse.fromJson(Map<String, dynamic> json) =>
      _$ConsideringListResponseFromJson(json);
}

@freezed
class ReceiptListItem with _$ReceiptListItem {
  const factory ReceiptListItem({
    @JsonKey(name: 'user_product_id') required int userProductId,
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_img') String? productImg,
    required int price,
    @JsonKey(name: 'discount_rate') double? discountRate,
  }) = _ReceiptListItem;

  factory ReceiptListItem.fromJson(Map<String, dynamic> json) =>
      _$ReceiptListItemFromJson(json);
}

@freezed
class ReceiptListResponse with _$ReceiptListResponse {
  const factory ReceiptListResponse({
    required String status,
    required List<ReceiptListItem> data,
  }) = _ReceiptListResponse;

  factory ReceiptListResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptListResponseFromJson(json);
}

@freezed
class ReceiptDetail with _$ReceiptDetail {
  const factory ReceiptDetail({
    @JsonKey(name: 'user_product_id') required int userProductId,
    @JsonKey(name: 'mall_name') String? mallName,
    String? brand,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_img') String? productImg,
    required int price,
    @JsonKey(name: 'discount_rate') double? discountRate,
    @JsonKey(name: 'saved_amount') int? savedAmount,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'duration_days') int? durationDays,
  }) = _ReceiptDetail;

  factory ReceiptDetail.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDetailFromJson(json);
}

@freezed
class ReceiptDetailResponse with _$ReceiptDetailResponse {
  const factory ReceiptDetailResponse({
    required String status,
    required ReceiptDetail data,
  }) = _ReceiptDetailResponse;

  factory ReceiptDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDetailResponseFromJson(json);
}
