import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokedex/presentation/providers/pokemon_details_provider.dart';
import 'package:pokedex/features/pokedex/presentation/screens/pokedex_screen.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokedex_error.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class PokemonDetailsScreen extends ConsumerWidget {
  final String pokemonName;
  const PokemonDetailsScreen({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(fetchPokemonDetailProvider(pokemonName));
    final isManualLoading = ref.watch(isManualLoadingProvider);
    AppLocalizations l10n = AppLocalizations.of(context)!;

    if (isManualLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 3)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(pokemonName)),
      body: pokemonAsync.when(
        data: (pokemon) => Column(
          children: [
            Image.network(pokemon.imageUrl),
            Text('¡Éxito! Este es ${pokemon.name}'),
          ],
        ),

        error: (error, stackTrace) => PokedexErrorWidget(
          title: l10n.errorTitle,
          massage: l10n.errorTitle,
          needButton: true,
          onRetry: () async {
            ref.read(isManualLoadingProvider.notifier).state = true;
            try {
              ref.invalidate(fetchPokemonDetailProvider(pokemonName));
              await ref.read(fetchPokemonDetailProvider(pokemonName).future);
            } catch (e) {
              debugPrint("Error: $e");
            } finally {
              ref.read(isManualLoadingProvider.notifier).state = false;
            }
          },
        ),

        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
