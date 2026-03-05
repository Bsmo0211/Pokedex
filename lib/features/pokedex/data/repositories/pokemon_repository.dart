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

    final pokemonRes = await dio.get('pokemon/${name.toLowerCase()}');
    final pokemonData = pokemonRes.data;

    final speciesUrl = pokemonData['species']['url'];
    final speciesRes = await dio.get(speciesUrl);
    final speciesData = speciesRes.data;
    final flavorTextEntries = speciesData['flavor_text_entries'] as List;
    final description = flavorTextEntries
        .firstWhere(
          (e) => e['language']['name'] == 'en',
          orElse: () => flavorTextEntries.first,
        )['flavor_text']
        .replaceAll('\n', ' ');

    final generaEntries = speciesData['genera'] as List;
    final category = generaEntries.firstWhere(
      (e) => e['language']['name'] == 'en',
      orElse: () => generaEntries.first,
    )['genus'];

    return Pokemon(
      id: pokemonData['id'],
      name: pokemonData['name'],
      imageUrl:
          pokemonData['sprites']['other']['official-artwork']['front_default'] ??
          '',
      types: (pokemonData['types'] as List)
          .map((t) => t['type']['name'].toString())
          .toList(),
      weight: pokemonData['weight'],
      height: pokemonData['height'],
      abilities: (pokemonData['abilities'] as List)
          .map((a) => a['ability']['name'].toString())
          .toList(),
      description: description,
      category: category,
    );
  }

  Future<List<Pokemon>> fetchPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    Dio dio = ref.read(dioProvider);

    Response<dynamic> response = await dio.get(
      'pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    List<dynamic> results = response.data['results'];

    final List<Future<Pokemon>> pokemonFutures = results.map((pokemon) async {
      Response<dynamic> detailRes = await dio.get(pokemon['url']);

      dynamic data = detailRes.data;

      return Pokemon(
        id: data['id'],
        name: data['name'],
        imageUrl:
            data['sprites']?['other']?['official-artwork']?['front_default'] ??
            '',
        types: (data['types'] as List)
            .map((t) => t['type']['name'].toString())
            .toList(),
        weight: data['weight'] ?? 0,
        height: data['height'] ?? 0,
        abilities: (data['abilities'] as List)
            .map((a) => a['ability']['name'].toString())
            .toList(),
        category: '',
        description: '',
      );
    }).toList();

    return await Future.wait(pokemonFutures);
  }
}

@riverpod
PokemonRepository pokemonRepository(Ref ref) {
  return PokemonRepository(ref);
}
