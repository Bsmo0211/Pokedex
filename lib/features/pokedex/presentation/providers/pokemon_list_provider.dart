import 'package:pokedex/features/pokedex/data/repositories/pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class PokemonList extends _$PokemonList {
  int _offset = 0;
  final int _limit = 20;

  @override
  Future<List<Pokemon>> build() async {
    return _fetchPage(offset: 0);
  }

  Future<List<Pokemon>> _fetchPage({required int offset}) async {
    final repo = ref.read(pokemonRepositoryProvider);

    // 2. Llamas al método normalmente.
    return await repo.fetchPokemonList(limit: _limit, offset: offset);
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading) return;

    List<Pokemon> currentState = state.value ?? [];
    _offset += _limit;

    state = const AsyncLoading<List<Pokemon>>().copyWithPrevious(state);

    state = await AsyncValue.guard(() async {
      List<Pokemon> nextItems = await _fetchPage(offset: _offset);
      return [...currentState, ...nextItems];
    });
  }
}
