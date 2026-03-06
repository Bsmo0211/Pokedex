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
    Map<String, int> damageCount = {};
    Dio dio = ref.read(dioProvider);

    Response<dynamic> pokemonRes = await dio.get(
      'pokemon/${name.toLowerCase()}',
    );
    dynamic pokemonData = pokemonRes.data;

    dynamic speciesUrl = pokemonData['species']['url'];
    Response<dynamic> speciesRes = await dio.get(speciesUrl);
    dynamic speciesData = speciesRes.data;

    List<dynamic> flavorEntries = speciesData['flavor_text_entries'] as List;
    String descEn = _extractText(flavorEntries, 'en', 'flavor_text');
    String descEs = _extractText(flavorEntries, 'es', 'flavor_text');

    List<dynamic> generaEntries = speciesData['genera'] as List;
    String catEn = _extractText(generaEntries, 'en', 'genus');
    String catEs = _extractText(generaEntries, 'es', 'genus');

    final abilityFutures = (pokemonData['abilities'] as List).map((a) async {
      String url = a['ability']['url'];
      String nameEnDefault = a['ability']['name'];

      Response<dynamic> res = await dio.get(url);
      List<dynamic> names = res.data['names'];

      return {
        'en': names.firstWhere(
          (n) => n['language']['name'] == 'en',
          orElse: () => {'name': nameEnDefault},
        )['name'],
        'es': names.firstWhere(
          (n) => n['language']['name'] == 'es',
          orElse: () => {'name': nameEnDefault},
        )['name'],
      };
    }).toList();

    final abilitiesResults = await Future.wait(abilityFutures);

    for (var typeEntry in pokemonData['types']) {
      String typeUrl = typeEntry['type']['url'];
      Response<dynamic> typeRes = await dio.get(typeUrl);
      for (var type in typeRes.data['damage_relations']['double_damage_from']) {
        String typeName = type['name'];
        damageCount[typeName] = (damageCount[typeName] ?? 0) + 1;
      }
    }

    int genderRate = speciesData['gender_rate'];
    bool isGenderless = genderRate == -1;
    double femalePercentage = isGenderless ? 0.0 : (genderRate / 8) * 100;
    double malePercentage = isGenderless ? 0.0 : 100.0 - femalePercentage;

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
      abilitiesEn: abilitiesResults.map((a) => a['en']!.toString()).toList(),
      abilitiesEs: abilitiesResults.map((a) => a['es']!.toString()).toList(),
      descriptionEn: descEn.replaceAll('\n', ' '),
      descriptionEs: descEs.replaceAll('\n', ' '),
      categoryEn: catEn,
      categoryEs: catEs,
      weaknesses: damageCount.keys.toList(),
      malePercentage: malePercentage,
      femalePercentage: femalePercentage,
      isGenderless: isGenderless,
    );
  }

  String _extractText(List<dynamic> entries, String lang, String key) {
    return entries.firstWhere(
      (e) => e['language']['name'] == lang,
      orElse: () => entries.isNotEmpty ? entries.first : {key: ''},
    )[key];
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
      );
    }).toList();

    return await Future.wait(pokemonFutures);
  }
}

@riverpod
PokemonRepository pokemonRepository(Ref ref) {
  return PokemonRepository(ref);
}
