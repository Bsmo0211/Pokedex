import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokedex/presentation/providers/pokemon_details_provider.dart';

class PokemonDetailsScreen extends ConsumerWidget {
  final String pokemonName;
  const PokemonDetailsScreen({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Escuchamos el provider
    final pokemonAsync = ref.watch(fetchPokemonDetailProvider(pokemonName));

    return Scaffold(
      appBar: AppBar(title: Text(pokemonName)),
      body: pokemonAsync.when(
        // CASO A: SI FUNCIONA (Data)
        data: (pokemon) => Column(
          children: [
            Image.network(pokemon.imageUrl),
            Text('¡Éxito! Este es ${pokemon.name}'),
            // Aquí pones toda tu interfaz bonita
          ],
        ),

        // CASO B: SI FALLA EL API (Error)
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 60),
              Text('Ocurrió un error: $error'),
              const SizedBox(height: 20),
              ElevatedButton(
                // Esto invalida el provider y vuelve a intentar la petición
                onPressed: () =>
                    ref.invalidate(fetchPokemonDetailProvider(pokemonName)),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),

        // CASO C: MIENTRAS CARGA (Loading)
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
