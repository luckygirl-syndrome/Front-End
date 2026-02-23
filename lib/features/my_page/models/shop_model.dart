import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

enum ShopName {
  @JsonValue('무신사')
  musinsa('무신사'),
  @JsonValue('에이블리')
  ably('에이블리'),
  @JsonValue('지그재그')
  zigzag('지그재그');

  final String label;
  const ShopName(this.label);
}

@freezed
class UserShopsUpdate with _$UserShopsUpdate {
  const factory UserShopsUpdate({
    @JsonKey(name: 'favorite_shops') required List<ShopName> favoriteShops,
  }) = _UserShopsUpdate;

  factory UserShopsUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserShopsUpdateFromJson(json);
}
