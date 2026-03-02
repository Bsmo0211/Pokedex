import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_details_provider.g.dart';

@riverpod
Future<Pokemon> fetchPokemonDetail(Ref ref, String pokemonName) async {
  PokemonRepository repository = ref.watch(pokemonRepositoryProvider);

  return await repository.fetchPokemon(pokemonName);
}
