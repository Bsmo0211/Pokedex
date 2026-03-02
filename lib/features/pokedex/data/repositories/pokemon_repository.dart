import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/network/dio_client.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository.g.dart';

class PokemonRepository {
  final Ref ref;
  PokemonRepository(this.ref);

  Future<Pokemon> fetchPokemon(String name) async {
    final dio = ref.read(dioProvider);
    try {
      final response = await dio.get('pokemon/${name.toLowerCase()}');
      return Pokemon.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('No se pudo cargar el Pokémon: ${e.message}');
    }
  }

  Future<List<Pokemon>> fetchPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    final dio = ref.read(dioProvider);
    final response = await dio.get(
      'pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );

    final List<dynamic> results = response.data['results'];

    // Usamos Future.wait para peticiones paralelas (más rápido que el bucle de 5 en 5)
    // Dart maneja esto en el background sin bloquear la UI
    final pokemonFutures = results.map((p) async {
      final detailRes = await dio.get(p['url']);
      final data = detailRes.data;

      // Aquí usamos tu modelo Freezed
      return Pokemon(
        id: data['id'],
        name: data['name'],
        imageUrl:
            data['sprites']['other']['official-artwork']['front_default'] ?? '',
        types: (data['types'] as List)
            .map((t) => t['type']['name'].toString())
            .toList(),
      );
    });

    return await Future.wait(pokemonFutures);
  }
}

@riverpod
PokemonRepository pokemonRepository(Ref ref) {
  return PokemonRepository(ref);
}
