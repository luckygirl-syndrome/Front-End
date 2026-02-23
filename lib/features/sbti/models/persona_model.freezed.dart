// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persona_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonaResponse _$PersonaResponseFromJson(Map<String, dynamic> json) {
  return _PersonaResponse.fromJson(json);
}

/// @nodoc
mixin _$PersonaResponse {
  Persona? get persona => throw _privateConstructorUsedError;

  /// Serializes this PersonaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonaResponseCopyWith<PersonaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonaResponseCopyWith<$Res> {
  factory $PersonaResponseCopyWith(
          PersonaResponse value, $Res Function(PersonaResponse) then) =
      _$PersonaResponseCopyWithImpl<$Res, PersonaResponse>;
  @useResult
  $Res call({Persona? persona});

  $PersonaCopyWith<$Res>? get persona;
}

/// @nodoc
class _$PersonaResponseCopyWithImpl<$Res, $Val extends PersonaResponse>
    implements $PersonaResponseCopyWith<$Res> {
  _$PersonaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? persona = freezed,
  }) {
    return _then(_value.copyWith(
      persona: freezed == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as Persona?,
    ) as $Val);
  }

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonaCopyWith<$Res>? get persona {
    if (_value.persona == null) {
      return null;
    }

    return $PersonaCopyWith<$Res>(_value.persona!, (value) {
      return _then(_value.copyWith(persona: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonaResponseImplCopyWith<$Res>
    implements $PersonaResponseCopyWith<$Res> {
  factory _$$PersonaResponseImplCopyWith(_$PersonaResponseImpl value,
          $Res Function(_$PersonaResponseImpl) then) =
      __$$PersonaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Persona? persona});

  @override
  $PersonaCopyWith<$Res>? get persona;
}

/// @nodoc
class __$$PersonaResponseImplCopyWithImpl<$Res>
    extends _$PersonaResponseCopyWithImpl<$Res, _$PersonaResponseImpl>
    implements _$$PersonaResponseImplCopyWith<$Res> {
  __$$PersonaResponseImplCopyWithImpl(
      _$PersonaResponseImpl _value, $Res Function(_$PersonaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? persona = freezed,
  }) {
    return _then(_$PersonaResponseImpl(
      persona: freezed == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as Persona?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonaResponseImpl implements _PersonaResponse {
  const _$PersonaResponseImpl({this.persona});

  factory _$PersonaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonaResponseImplFromJson(json);

  @override
  final Persona? persona;

  @override
  String toString() {
    return 'PersonaResponse(persona: $persona)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonaResponseImpl &&
            (identical(other.persona, persona) || other.persona == persona));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, persona);

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonaResponseImplCopyWith<_$PersonaResponseImpl> get copyWith =>
      __$$PersonaResponseImplCopyWithImpl<_$PersonaResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonaResponseImplToJson(
      this,
    );
  }
}

abstract class _PersonaResponse implements PersonaResponse {
  const factory _PersonaResponse({final Persona? persona}) =
      _$PersonaResponseImpl;

  factory _PersonaResponse.fromJson(Map<String, dynamic> json) =
      _$PersonaResponseImpl.fromJson;

  @override
  Persona? get persona;

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonaResponseImplCopyWith<_$PersonaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Persona _$PersonaFromJson(Map<String, dynamic> json) {
  return _Persona.fromJson(json);
}

/// @nodoc
mixin _$Persona {
  @JsonKey(name: 'persona_type')
  String get personaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'd_vs_n')
  AxisScore get dVsN => throw _privateConstructorUsedError;
  @JsonKey(name: 's_vs_a')
  AxisScore get sVsA => throw _privateConstructorUsedError;
  @JsonKey(name: 'm_vs_t')
  AxisScore get mVsT => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Persona to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonaCopyWith<Persona> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonaCopyWith<$Res> {
  factory $PersonaCopyWith(Persona value, $Res Function(Persona) then) =
      _$PersonaCopyWithImpl<$Res, Persona>;
  @useResult
  $Res call(
      {@JsonKey(name: 'persona_type') String personaType,
      @JsonKey(name: 'd_vs_n') AxisScore dVsN,
      @JsonKey(name: 's_vs_a') AxisScore sVsA,
      @JsonKey(name: 'm_vs_t') AxisScore mVsT,
      String description});

  $AxisScoreCopyWith<$Res> get dVsN;
  $AxisScoreCopyWith<$Res> get sVsA;
  $AxisScoreCopyWith<$Res> get mVsT;
}

/// @nodoc
class _$PersonaCopyWithImpl<$Res, $Val extends Persona>
    implements $PersonaCopyWith<$Res> {
  _$PersonaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personaType = null,
    Object? dVsN = null,
    Object? sVsA = null,
    Object? mVsT = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      personaType: null == personaType
          ? _value.personaType
          : personaType // ignore: cast_nullable_to_non_nullable
              as String,
      dVsN: null == dVsN
          ? _value.dVsN
          : dVsN // ignore: cast_nullable_to_non_nullable
              as AxisScore,
      sVsA: null == sVsA
          ? _value.sVsA
          : sVsA // ignore: cast_nullable_to_non_nullable
              as AxisScore,
      mVsT: null == mVsT
          ? _value.mVsT
          : mVsT // ignore: cast_nullable_to_non_nullable
              as AxisScore,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AxisScoreCopyWith<$Res> get dVsN {
    return $AxisScoreCopyWith<$Res>(_value.dVsN, (value) {
      return _then(_value.copyWith(dVsN: value) as $Val);
    });
  }

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AxisScoreCopyWith<$Res> get sVsA {
    return $AxisScoreCopyWith<$Res>(_value.sVsA, (value) {
      return _then(_value.copyWith(sVsA: value) as $Val);
    });
  }

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AxisScoreCopyWith<$Res> get mVsT {
    return $AxisScoreCopyWith<$Res>(_value.mVsT, (value) {
      return _then(_value.copyWith(mVsT: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonaImplCopyWith<$Res> implements $PersonaCopyWith<$Res> {
  factory _$$PersonaImplCopyWith(
          _$PersonaImpl value, $Res Function(_$PersonaImpl) then) =
      __$$PersonaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'persona_type') String personaType,
      @JsonKey(name: 'd_vs_n') AxisScore dVsN,
      @JsonKey(name: 's_vs_a') AxisScore sVsA,
      @JsonKey(name: 'm_vs_t') AxisScore mVsT,
      String description});

  @override
  $AxisScoreCopyWith<$Res> get dVsN;
  @override
  $AxisScoreCopyWith<$Res> get sVsA;
  @override
  $AxisScoreCopyWith<$Res> get mVsT;
}

/// @nodoc
class __$$PersonaImplCopyWithImpl<$Res>
    extends _$PersonaCopyWithImpl<$Res, _$PersonaImpl>
    implements _$$PersonaImplCopyWith<$Res> {
  __$$PersonaImplCopyWithImpl(
      _$PersonaImpl _value, $Res Function(_$PersonaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personaType = null,
    Object? dVsN = null,
    Object? sVsA = null,
    Object? mVsT = null,
    Object? description = null,
  }) {
    return _then(_$PersonaImpl(
      personaType: null == personaType
          ? _value.personaType
          : personaType // ignore: cast_nullable_to_non_nullable
              as String,
      dVsN: null == dVsN
          ? _value.dVsN
          : dVsN // ignore: cast_nullable_to_non_nullable
              as AxisScore,
      sVsA: null == sVsA
          ? _value.sVsA
          : sVsA // ignore: cast_nullable_to_non_nullable
              as AxisScore,
      mVsT: null == mVsT
          ? _value.mVsT
          : mVsT // ignore: cast_nullable_to_non_nullable
              as AxisScore,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonaImpl implements _Persona {
  const _$PersonaImpl(
      {@JsonKey(name: 'persona_type') required this.personaType,
      @JsonKey(name: 'd_vs_n') required this.dVsN,
      @JsonKey(name: 's_vs_a') required this.sVsA,
      @JsonKey(name: 'm_vs_t') required this.mVsT,
      required this.description});

  factory _$PersonaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonaImplFromJson(json);

  @override
  @JsonKey(name: 'persona_type')
  final String personaType;
  @override
  @JsonKey(name: 'd_vs_n')
  final AxisScore dVsN;
  @override
  @JsonKey(name: 's_vs_a')
  final AxisScore sVsA;
  @override
  @JsonKey(name: 'm_vs_t')
  final AxisScore mVsT;
  @override
  final String description;

  @override
  String toString() {
    return 'Persona(personaType: $personaType, dVsN: $dVsN, sVsA: $sVsA, mVsT: $mVsT, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonaImpl &&
            (identical(other.personaType, personaType) ||
                other.personaType == personaType) &&
            (identical(other.dVsN, dVsN) || other.dVsN == dVsN) &&
            (identical(other.sVsA, sVsA) || other.sVsA == sVsA) &&
            (identical(other.mVsT, mVsT) || other.mVsT == mVsT) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, personaType, dVsN, sVsA, mVsT, description);

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonaImplCopyWith<_$PersonaImpl> get copyWith =>
      __$$PersonaImplCopyWithImpl<_$PersonaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonaImplToJson(
      this,
    );
  }
}

abstract class _Persona implements Persona {
  const factory _Persona(
      {@JsonKey(name: 'persona_type') required final String personaType,
      @JsonKey(name: 'd_vs_n') required final AxisScore dVsN,
      @JsonKey(name: 's_vs_a') required final AxisScore sVsA,
      @JsonKey(name: 'm_vs_t') required final AxisScore mVsT,
      required final String description}) = _$PersonaImpl;

  factory _Persona.fromJson(Map<String, dynamic> json) = _$PersonaImpl.fromJson;

  @override
  @JsonKey(name: 'persona_type')
  String get personaType;
  @override
  @JsonKey(name: 'd_vs_n')
  AxisScore get dVsN;
  @override
  @JsonKey(name: 's_vs_a')
  AxisScore get sVsA;
  @override
  @JsonKey(name: 'm_vs_t')
  AxisScore get mVsT;
  @override
  String get description;

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonaImplCopyWith<_$PersonaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AxisScore _$AxisScoreFromJson(Map<String, dynamic> json) {
  return _AxisScore.fromJson(json);
}

/// @nodoc
mixin _$AxisScore {
  String get result => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Serializes this AxisScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AxisScoreCopyWith<AxisScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AxisScoreCopyWith<$Res> {
  factory $AxisScoreCopyWith(AxisScore value, $Res Function(AxisScore) then) =
      _$AxisScoreCopyWithImpl<$Res, AxisScore>;
  @useResult
  $Res call({String result, int score});
}

/// @nodoc
class _$AxisScoreCopyWithImpl<$Res, $Val extends AxisScore>
    implements $AxisScoreCopyWith<$Res> {
  _$AxisScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AxisScoreImplCopyWith<$Res>
    implements $AxisScoreCopyWith<$Res> {
  factory _$$AxisScoreImplCopyWith(
          _$AxisScoreImpl value, $Res Function(_$AxisScoreImpl) then) =
      __$$AxisScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String result, int score});
}

/// @nodoc
class __$$AxisScoreImplCopyWithImpl<$Res>
    extends _$AxisScoreCopyWithImpl<$Res, _$AxisScoreImpl>
    implements _$$AxisScoreImplCopyWith<$Res> {
  __$$AxisScoreImplCopyWithImpl(
      _$AxisScoreImpl _value, $Res Function(_$AxisScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? score = null,
  }) {
    return _then(_$AxisScoreImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AxisScoreImpl implements _AxisScore {
  const _$AxisScoreImpl({required this.result, required this.score});

  factory _$AxisScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$AxisScoreImplFromJson(json);

  @override
  final String result;
  @override
  final int score;

  @override
  String toString() {
    return 'AxisScore(result: $result, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AxisScoreImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, result, score);

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AxisScoreImplCopyWith<_$AxisScoreImpl> get copyWith =>
      __$$AxisScoreImplCopyWithImpl<_$AxisScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AxisScoreImplToJson(
      this,
    );
  }
}

abstract class _AxisScore implements AxisScore {
  const factory _AxisScore(
      {required final String result,
      required final int score}) = _$AxisScoreImpl;

  factory _AxisScore.fromJson(Map<String, dynamic> json) =
      _$AxisScoreImpl.fromJson;

  @override
  String get result;
  @override
  int get score;

  /// Create a copy of AxisScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AxisScoreImplCopyWith<_$AxisScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
