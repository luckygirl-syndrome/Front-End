import 'package:flutter/foundation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/sbti/models/persona_model.dart';
import 'package:ttobaba/features/sbti/repositories/persona_repository.dart';
import 'package:ttobaba/core/network/dio_provider.dart';

part 'persona_provider.g.dart';

@Riverpod(keepAlive: true)
class PersonaState extends _$PersonaState {
  @override
  FutureOr<Persona?> build() async {
    return _fetchPersona();
  }

  Future<Persona?> _fetchPersona() async {
    try {
      final storage = ref.read(secureStorageProvider);
      final token = await storage.read(key: 'access_token');
      if (token == null) return null;

      final repository = ref.read(personaRepositoryProvider);
      return await repository.getPersona();
    } catch (e) {
      debugPrint("Fetch Persona Error: $e");
      return null;
    }
  }

  Future<void> updatePersona(Persona persona) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(personaRepositoryProvider);
      await repository.updatePersona(persona);
      // Refresh or set new state
      state = AsyncValue.data(persona);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
