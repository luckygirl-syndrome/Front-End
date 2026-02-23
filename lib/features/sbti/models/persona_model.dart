import 'package:freezed_annotation/freezed_annotation.dart';

part 'persona_model.freezed.dart';
part 'persona_model.g.dart';

@freezed
class PersonaResponse with _$PersonaResponse {
  const factory PersonaResponse({
    Persona? persona,
  }) = _PersonaResponse;

  factory PersonaResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonaResponseFromJson(json);
}

@freezed
class Persona with _$Persona {
  const factory Persona({
    @JsonKey(name: 'persona_type') required String personaType,
    @JsonKey(name: 'd_vs_n') required AxisScore dVsN,
    @JsonKey(name: 's_vs_a') required AxisScore sVsA,
    @JsonKey(name: 'm_vs_t') required AxisScore mVsT,
    required String description,
  }) = _Persona;

  factory Persona.fromJson(Map<String, dynamic> json) =>
      _$PersonaFromJson(json);
}

@freezed
class AxisScore with _$AxisScore {
  const factory AxisScore({
    required String result,
    required int score,
  }) = _AxisScore;

  factory AxisScore.fromJson(Map<String, dynamic> json) =>
      _$AxisScoreFromJson(json);
}
