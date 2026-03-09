import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/favorites/presentation/providers/pokemon_favorites_provider.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokedex_error.dart';

import 'package:pokedex/features/pokedex/presentation/widgets/pokemon_card.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations l10n = AppLocalizations.of(context)!;

    List<Pokemon> favoriteList = ref.watch(pokemonFavoritesProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.favoritesTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: favoriteList.isEmpty
            ? PokedexErrorWidget(
                title: l10n.noFavoritesTitle,
                massage: l10n.noFavoritesMessage,
                needButton: false,
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  Pokemon pokemon = favoriteList[index];

                  return Dismissible(
                    key: Key('fav_${pokemon.id}'),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      height: 120,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 30),
                      child: const Row(
                        // Cambié a Row para que el icono y texto se alineen bien
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Eliminar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    resizeDuration: const Duration(milliseconds: 300),
                    movementDuration: const Duration(milliseconds: 200),
                    onDismissed: (direction) {
                      ref
                          .read(pokemonFavoritesProvider.notifier)
                          .toggleFavorite(pokemon);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.black87,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          content: Text(
                            l10n.pokemonRemoved(pokemon.name),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },

                    child: SizedBox(
                      width: double.infinity,
                      child: PokemonCard(pokemon: pokemon),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
