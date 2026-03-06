import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/utils/get_type_colors.dart';
import 'package:pokedex/core/utils/get_type_icon.dart';
import 'package:pokedex/features/favorites/presentation/providers/pokemon_favorites_provider.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/presentation/providers/pokemon_details_provider.dart';
import 'package:pokedex/features/pokedex/presentation/screens/pokedex_screen.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/gender_bar.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/header_curved_container.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/info_grid.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokedex_error.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/type_chip.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class PokemonDetailsScreen extends ConsumerWidget {
  final String pokemonName;
  const PokemonDetailsScreen({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final langCode = Localizations.localeOf(context).languageCode;
    AsyncValue<Pokemon> pokemonAsync = ref.watch(
      fetchPokemonDetailProvider(pokemonName),
    );
    bool isManualLoading = ref.watch(isManualLoadingProvider);
    AppLocalizations l10n = AppLocalizations.of(context)!;

    if (isManualLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 3)),
      );
    }

    return Scaffold(
      body: pokemonAsync.when(
        data: (pokemon) {
          final mainColor = GetTypeColors.getTypeColor(pokemon.types.first);
          bool isFavorite = ref
              .watch(pokemonFavoritesProvider)
              .any((p) => p.id == pokemon.id);
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 350),
                  painter: HeaderCurvedContainer(color: mainColor),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 350,
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: 0.8,
                    child: SvgPicture.asset(
                      GetTypeSvg.getTypeSvg(pokemon.types.first),
                      width: 200,
                      height: 200,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),

              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(pokemonFavoritesProvider.notifier)
                                    .toggleFavorite(pokemon);
                              },
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Center(
                        child: SizedBox(
                          height: 220,
                          child: Image.network(
                            pokemon.imageUrl,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.help_outline, size: 100),
                          ),
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.black : Colors.white,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pokemon.name.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Nº${pokemon.id.toString().padLeft(3, '0')}",
                              style: const TextStyle(
                                fontSize: 18,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),

                            Row(
                              children: pokemon.types
                                  .map(
                                    (type) => TypeChip(
                                      type: type,
                                      fontSize: 16,
                                      iconSize: 20,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),

                            const SizedBox(height: 25),

                            Text(
                              pokemon.localizedDescription(langCode),
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ),

                            const SizedBox(height: 30),
                            PokemonInfoGrid(pokemon: pokemon),

                            const SizedBox(height: 30),
                            PokemonGenderBar(pokemon: pokemon),

                            const SizedBox(height: 20),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(l10n.weaknesses),
                            ),

                            Wrap(
                              children: pokemon.weaknesses
                                  .map(
                                    (type) => TypeChip(
                                      type: type,
                                      fontSize: 16,
                                      iconSize: 20,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => PokedexErrorWidget(
          title: l10n.errorTitle,
          massage: error.toString(),
          needButton: true,
          onRetry: () =>
              ref.invalidate(fetchPokemonDetailProvider(pokemonName)),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
