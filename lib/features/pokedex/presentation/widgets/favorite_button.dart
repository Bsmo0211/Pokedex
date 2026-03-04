import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/favorites/presentation/providers/pokemon_favorites_provider.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class FavoriteButton extends ConsumerWidget {
  final Pokemon pokemon;

  const FavoriteButton({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFavorite = ref
        .watch(pokemonFavoritesProvider)
        .any((p) => p.id == pokemon.id);

    return Positioned(
      top: 12,
      right: 12,
      child: GestureDetector(
        onTap: () {
          ref.read(pokemonFavoritesProvider.notifier).toggleFavorite(pokemon);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(125, 29, 25, 25),
            border: Border.all(color: Colors.white54, width: 1.5),
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
