// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonaResponseImpl _$$PersonaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonaResponseImpl(
      persona: json['persona'] == null
          ? null
          : Persona.fromJson(json['persona'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PersonaResponseImplToJson(
        _$PersonaResponseImpl instance) =>
    <String, dynamic>{
      'persona': instance.persona,
    };

_$PersonaImpl _$$PersonaImplFromJson(Map<String, dynamic> json) =>
    _$PersonaImpl(
      personaType: json['persona_type'] as String,
      dVsN: AxisScore.fromJson(json['d_vs_n'] as Map<String, dynamic>),
      sVsA: AxisScore.fromJson(json['s_vs_a'] as Map<String, dynamic>),
      mVsT: AxisScore.fromJson(json['m_vs_t'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$PersonaImplToJson(_$PersonaImpl instance) =>
    <String, dynamic>{
      'persona_type': instance.personaType,
      'd_vs_n': instance.dVsN,
      's_vs_a': instance.sVsA,
      'm_vs_t': instance.mVsT,
      'description': instance.description,
    };

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
