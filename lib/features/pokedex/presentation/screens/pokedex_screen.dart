import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/presentation/providers/pokemon_list_provider.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/filter_bar.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokedex_error.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokemon_card.dart';
import 'package:pokedex/l10n/app_localizations.dart';

final isManualLoadingProvider = StateProvider<bool>((ref) => false);

class PokedexScreen extends ConsumerStatefulWidget {
  const PokedexScreen({super.key});

  @override
  ConsumerState<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends ConsumerState<PokedexScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isFetching = false;
  String searchQuery = "";
  final List<String> selectedTypes = [];

  List<Pokemon> _getFilteredPokemon(List<Pokemon> allPokemon) {
    return allPokemon.where((pokemon) {
      final bool matchesName = pokemon.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      final bool matchesType =
          selectedTypes.isEmpty ||
          pokemon.types.any((t) => selectedTypes.contains(t.toLowerCase()));

      return matchesName && matchesType;
    }).toList();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      if (!_isFetching) {
        // Verificación extra
        _isFetching = true;
        ref.read(pokemonListProvider.notifier).fetchNextPage().then((_) {
          _isFetching = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    AsyncValue<List<Pokemon>> pokemonListAsync = ref.watch(pokemonListProvider);
    bool isManualLoading = ref.watch(isManualLoadingProvider);

    if (isManualLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 3)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.pokedexTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: pokemonListAsync.when(
        data: (pokemonList) {
          List<Pokemon> filteredList = _getFilteredPokemon(pokemonList);

          return Column(
            children: [
              FilterBar(
                searchQuery: searchQuery,
                selectedTypes: selectedTypes,
                onFiltersChanged: () {
                  setState(() {});
                },
                onSearchChanged: (value) {
                  setState(() => searchQuery = value);
                },
              ),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,

                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount:
                      filteredList.length +
                      (pokemonListAsync.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == filteredList.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return PokemonCard(pokemon: filteredList[index]);
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => PokedexErrorWidget(
          title: l10n.errorTitle,
          massage: l10n.errorTitle,
          needButton: true,
          onRetry: () async {
            ref.read(isManualLoadingProvider.notifier).state = true;
            try {
              ref.invalidate(pokemonListProvider);
              await ref.read(pokemonListProvider.future);
            } catch (e) {
              debugPrint("Error: $e");
            } finally {
              ref.read(isManualLoadingProvider.notifier).state = false;
            }
          },
        ),
      ),
    );
  }
}
