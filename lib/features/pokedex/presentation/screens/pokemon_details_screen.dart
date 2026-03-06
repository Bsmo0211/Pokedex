import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/utils/get_type_colors.dart';
import 'package:pokedex/core/utils/get_type_icon.dart';
import 'package:pokedex/features/pokedex/presentation/providers/pokemon_details_provider.dart';
import 'package:pokedex/features/pokedex/presentation/screens/pokedex_screen.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/header_curved_container.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/pokedex_error.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/type_chip.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class PokemonDetailsScreen extends ConsumerWidget {
  final String pokemonName;
  const PokemonDetailsScreen({super.key, required this.pokemonName});

  String _capitalize(String text) =>
      text.isEmpty ? "" : "${text[0].toUpperCase()}${text.substring(1)}";

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
      backgroundColor: Colors.white,
      body: pokemonAsync.when(
        data: (pokemon) {
          final mainColor = GetTypeColors.getTypeColor(pokemon.types.first);

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
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 28,
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
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
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
                                color: Colors.grey,
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
                              pokemon.description,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 30),
                            _buildInfoGrid(pokemon),

                            const SizedBox(height: 30),
                            _buildGenderBar(),

                            const SizedBox(height: 20),

                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Debilidades'),
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

  Widget _buildInfoGrid(dynamic pokemon) {
    final weight = (pokemon.weight / 10)
        .toStringAsFixed(1)
        .replaceAll('.', ',');
    final height = (pokemon.height / 10)
        .toStringAsFixed(1)
        .replaceAll('.', ',');

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 2.2,
      children: [
        _infoItem("PESO", "$weight kg", Icons.scale),
        _infoItem("ALTURA", "$height m", Icons.height),
        _infoItem("CATEGORÍA", pokemon.category, Icons.widgets),
        _infoItem(
          "HABILIDAD",
          _capitalize(pokemon.abilities.first),
          Icons.bolt,
        ),
      ],
    );
  }

  Widget _infoItem(String title, String value, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F8FC),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 14, color: Colors.grey),
              const SizedBox(width: 5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderBar() {
    return Column(
      children: [
        const Text(
          "GÉNERO",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            children: [
              Expanded(
                flex: 87,
                child: Container(height: 10, color: Colors.blue),
              ),
              Expanded(
                flex: 13,
                child: Container(height: 10, color: Colors.pink),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "♂ 87,5%",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Text(
              "♀ 12,5%",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}
