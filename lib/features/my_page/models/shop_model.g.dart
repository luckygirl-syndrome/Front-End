// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserShopsUpdateImpl _$$UserShopsUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$UserShopsUpdateImpl(
      favoriteShops: (json['favorite_shops'] as List<dynamic>)
          .map((e) => $enumDecode(_$ShopNameEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$UserShopsUpdateImplToJson(
        _$UserShopsUpdateImpl instance) =>
    <String, dynamic>{
      'favorite_shops':
          instance.favoriteShops.map((e) => _$ShopNameEnumMap[e]!).toList(),
    };

const _$ShopNameEnumMap = {
  ShopName.musinsa: '무신사',
  ShopName.ably: '에이블리',
  ShopName.zigzag: '지그재그',
};
