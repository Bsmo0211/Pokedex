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
    Dio dio = ref.read(dioProvider);
    try {
      Response<dynamic> response = await dio.get(
        'pokemon/${name.toLowerCase()}',
      );
      return Pokemon.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('No se pudo cargar el Pokémon: ${e.message}');
    }
  }

  Future<List<Pokemon>> fetchPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    const int batchSize = 5;
    Dio dio = ref.read(dioProvider);
    Response<dynamic> response = await dio.get(
      'pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );

    List<dynamic> results = response.data['results'];
    List<Pokemon> allPokemon = [];

    //TODO: preguntar que es mejor los 20 de una o 5 a 5
    for (int i = 0; i < results.length; i += batchSize) {
      int end = (i + batchSize < results.length)
          ? i + batchSize
          : results.length;
      List<dynamic> chunk = results.sublist(i, end);

      Iterable<Future<Pokemon>> chunkFutures = chunk.map((p) async {
        Response<dynamic> detailRes = await dio.get(p['url']);
        dynamic data = detailRes.data;

        return Pokemon(
          id: data['id'],
          name: data['name'],
          imageUrl:
              data['sprites']['other']['official-artwork']['front_default'] ??
              '',
          types: (data['types'] as List)
              .map((t) => t['type']['name'].toString())
              .toList(),
        );
      });

      List<Pokemon> chunkResults = await Future.wait(chunkFutures);

      allPokemon.addAll(chunkResults);
    }

    return allPokemon;
  }
}

@riverpod
PokemonRepository pokemonRepository(Ref ref) {
  return PokemonRepository(ref);
}
