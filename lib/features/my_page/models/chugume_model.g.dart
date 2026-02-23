// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chugume_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChugumeUpdateImpl _$$ChugumeUpdateImplFromJson(Map<String, dynamic> json) =>
    _$ChugumeUpdateImpl(
      chugumeType: $enumDecode(_$ChugumeTypeEnumMap, json['chugume_type']),
    );

Map<String, dynamic> _$$ChugumeUpdateImplToJson(_$ChugumeUpdateImpl instance) =>
    <String, dynamic>{
      'chugume_type': _$ChugumeTypeEnumMap[instance.chugumeType]!,
    };

const _$ChugumeTypeEnumMap = {
  ChugumeType.morigirl: '모리걸',
  ChugumeType.demure: '드뮤어',
  ChugumeType.girlcore: '걸코어',
  ChugumeType.sportyGlam: '스포티 글램',
};
