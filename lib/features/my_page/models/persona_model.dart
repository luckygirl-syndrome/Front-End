class PersonaModel {
  final String personaType;
  final String description;

  PersonaModel({
    required this.personaType,
    required this.description,
  });

  // 💡 서버 데이터가 이상해도 죽지 않는 최고의 파싱 코드
  factory PersonaModel.fromJson(Map<String, dynamic>? json) {
    // 1. 전체 데이터가 null인 경우 기본 모델 반환
    if (json == null) return PersonaModel.defaultPersona();

    // 2. 서버 응답 구조가 {"persona": {...}} 형태일 경우를 대비
    final data = json['persona'] ?? json; 

    return PersonaModel(
      personaType: data['persona_type'] ?? '',
      description: data['description'] ?? '랭킹 맹신 쇼퍼',
    );
  }

  // 💡 기본값 객체를 따로 정의해두면 유지보수가 편합니다.
  factory PersonaModel.defaultPersona() {
    return PersonaModel(
      personaType: '',
      description: '랭킹 맹신 쇼퍼',
    );
  }
}
