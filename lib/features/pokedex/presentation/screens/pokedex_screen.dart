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
      // Filtro por nombre
      final bool matchesName = pokemon.name.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      // Filtro por tipo
      final bool matchesType =
          selectedTypes.isEmpty ||
          pokemon.types.any((t) => selectedTypes.contains(t.toLowerCase()));

      return matchesName && matchesType;
    }).toList();
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        !_isFetching) {
      _isFetching = true;
      await ref.read(pokemonListProvider.notifier).fetchNextPage();
      if (mounted) {
        _isFetching = false;
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) =>
                      PokemonCard(pokemon: filteredList[index]),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => PokedexErrorWidget(
          onRetry: () => ref.invalidate(pokemonListProvider),
        ),
      ),
    );
  }
}
