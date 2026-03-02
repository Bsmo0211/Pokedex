import 'package:dio/dio.dart';
import 'package:pokedex/core/network/dio_client.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository.g.dart';

@riverpod
class PokemonRepository extends _$PokemonRepository {
  @override
  void build() {}

  Future<List<Pokemon>> fetchPokemonList({
    int limit = 20,
    int offset = 0,
  }) async {
    Dio dio = ref.read(dioProvider);
    Response<dynamic> response = await dio.get(
      'pokemon',
      queryParameters: {'limit': limit, 'offset': offset},
    );
    List<dynamic> results = response.data['results'] as List;

    List<Pokemon> pokemonList = [];

    /* Procesamos de 5 en 5 para no bloquear el canal de datos, 
    al procesar las 20 hacemos que se sienta un lag en la pantalla */
    for (var i = 0; i < results.length; i += 5) {
      List<dynamic> chunk = results.sublist(
        i,
        i + 5 > results.length ? results.length : i + 5,
      );

      List<Pokemon> chunkResults = await Future.wait(
        chunk.map((p) async {
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
        }),
      );

      pokemonList.addAll(chunkResults);
    }

    return pokemonList;
  }
}
