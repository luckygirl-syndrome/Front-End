import 'package:flutter/foundation.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ttobaba/core/network/dio_provider.dart';
import 'package:ttobaba/features/sbti/models/persona_model.dart';

final personaRepositoryProvider = Provider<PersonaRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PersonaRepository(dio);
});

class PersonaRepository {
  final Dio _dio;

  PersonaRepository(this._dio);

  Future<Persona?> getPersona() async {
    try {
      final response = await _dio.get('/api/profile/persona');
      return PersonaResponse.fromJson(response.data).persona;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePersona(Persona persona) async {
    try {
      final body = persona.toJson();
      debugPrint("🚀 [REQ BODY] ${jsonEncode(body)}");

      await _dio.post(
        '/api/setting/profile/persona',
        data: body,
      );
    } catch (e) {
      rethrow;
    }
  }
}
