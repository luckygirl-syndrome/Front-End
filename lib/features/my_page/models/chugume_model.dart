import 'package:freezed_annotation/freezed_annotation.dart';

part 'chugume_model.freezed.dart';
part 'chugume_model.g.dart';

enum ChugumeType {
  @JsonValue('모리걸')
  morigirl('모리걸'),
  @JsonValue('드뮤어')
  demure('드뮤어'),
  @JsonValue('걸코어')
  girlcore('걸코어'),
  @JsonValue('스포티 글램')
  sportyGlam('스포티 글램');

  final String label;
  const ChugumeType(this.label);
}

@freezed
class ChugumeUpdate with _$ChugumeUpdate {
  const factory ChugumeUpdate({
    @JsonKey(name: 'chugume_type') required ChugumeType chugumeType,
  }) = _ChugumeUpdate;

  factory ChugumeUpdate.fromJson(Map<String, dynamic> json) =>
      _$ChugumeUpdateFromJson(json);
}
