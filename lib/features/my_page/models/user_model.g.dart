// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      nickname: json['nickname'] as String,
      profileImg: json['profile_img'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profile_img': instance.profileImg,
      'description': instance.description,
    };

_$ProfileUpdateRequestImpl _$$ProfileUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileUpdateRequestImpl(
      nickname: json['nickname'] as String?,
      profileImg: json['profile_img'] as String?,
    );

Map<String, dynamic> _$$ProfileUpdateRequestImplToJson(
        _$ProfileUpdateRequestImpl instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'profile_img': instance.profileImg,
    };

_$ClosetStatsImpl _$$ClosetStatsImplFromJson(Map<String, dynamic> json) =>
    _$ClosetStatsImpl(
      boughtCount: (json['bought_count'] as num).toInt(),
      boughtPrice: (json['bought_price'] as num).toInt(),
      droppedCount: (json['dropped_count'] as num).toInt(),
      droppedPrice: (json['dropped_price'] as num).toInt(),
    );

Map<String, dynamic> _$$ClosetStatsImplToJson(_$ClosetStatsImpl instance) =>
    <String, dynamic>{
      'bought_count': instance.boughtCount,
      'bought_price': instance.boughtPrice,
      'dropped_count': instance.droppedCount,
      'dropped_price': instance.droppedPrice,
    };
