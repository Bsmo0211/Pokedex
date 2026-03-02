import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokedex_error.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokemon_card.dart';
import '../providers/pokemon_list_provider.dart';
// Tu provider en carpeta

final isManualLoadingProvider = StateProvider<bool>((ref) => false);

class PokedexScreen extends ConsumerStatefulWidget {
  const PokedexScreen({super.key});

  @override
  ConsumerState<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends ConsumerState<PokedexScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isFetching = false; // El candado

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      // Si falta poco para el final Y no estamos ya buscando...
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          !_isFetching) {
        _isFetching = true; // Cerramos candado

        await ref.read(pokemonListProvider.notifier).fetchNextPage();

        _isFetching = false; // Abrimos candado
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemonListAsync = ref.watch(pokemonListProvider);
    final isManualLoading = ref.watch(isManualLoadingProvider);

    if (isManualLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator(strokeWidth: 3)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pokédex',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: pokemonListAsync.when(
        data: (pokemonList) {
          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: pokemonList.length + 1,
            itemBuilder: (context, index) {
              if (index < pokemonList.length) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PokemonCard(pokemon: pokemonList[index]),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              }
            },
          );
        },
        loading: () =>
            const Center(child: CircularProgressIndicator(strokeWidth: 3)),
        error: (err, stack) => PokedexErrorWidget(
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
