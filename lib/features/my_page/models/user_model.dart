import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String nickname,
    @JsonKey(name: 'profile_img') String? profileImg,
    String? description,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  const factory ProfileUpdateRequest({
    String? nickname,
    @JsonKey(name: 'profile_img') String? profileImg,
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}

@freezed
class ClosetStats with _$ClosetStats {
  const factory ClosetStats({
    @JsonKey(name: 'bought_count') required int boughtCount,
    @JsonKey(name: 'bought_price') required int boughtPrice,
    @JsonKey(name: 'dropped_count') required int droppedCount,
    @JsonKey(name: 'dropped_price') required int droppedPrice,
  }) = _ClosetStats;

  factory ClosetStats.fromJson(Map<String, dynamic> json) =>
      _$ClosetStatsFromJson(json);
}
