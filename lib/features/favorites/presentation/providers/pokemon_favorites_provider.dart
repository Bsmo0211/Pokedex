import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_favorites_provider.g.dart';

@riverpod
class PokemonFavorites extends _$PokemonFavorites {
  @override
  List<Pokemon> build() {
    return [];
  }

  void toggleFavorite(Pokemon pokemon) {
    bool isExist = state.any((p) => p.id == pokemon.id);

    if (isExist) {
      state = state.where((p) => p.id != pokemon.id).toList();
    } else {
      state = [...state, pokemon];
    }
  }
}
