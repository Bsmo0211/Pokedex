import 'package:flutter/material.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class PokemonGenderBar extends StatelessWidget {
  final dynamic pokemon;

  const PokemonGenderBar({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    AppLocalizations l10n = AppLocalizations.of(context)!;

    if (pokemon.isGenderless) {
      return Text(
        "Género desconocido / Sin género",
        style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
      );
    }

    int maleFlex = pokemon.malePercentage.toInt();
    int femaleFlex = pokemon.femalePercentage.toInt();

    return Column(
      children: [
        Text(
          l10n.gender,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 10,
            child: Row(
              children: [
                if (maleFlex > 0)
                  Expanded(
                    flex: maleFlex,
                    child: Container(color: Colors.blueAccent),
                  ),
                if (femaleFlex > 0)
                  Expanded(
                    flex: femaleFlex,
                    child: Container(color: Colors.pinkAccent),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "♂ ${pokemon.malePercentage.toStringAsFixed(1)}%",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.blue[200] : Colors.blue[800],
              ),
            ),
            Text(
              "♀ ${pokemon.femalePercentage.toStringAsFixed(1)}%",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.pink[200] : Colors.pink[800],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
