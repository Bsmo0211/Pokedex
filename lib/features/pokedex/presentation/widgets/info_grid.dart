import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/info_item.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class PokemonInfoGrid extends StatelessWidget {
  final dynamic pokemon;

  const PokemonInfoGrid({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final langCode = Localizations.localeOf(context).languageCode;
    AppLocalizations l10n = AppLocalizations.of(context)!;
    dynamic weight = (pokemon.weight / 10)
        .toStringAsFixed(1)
        .replaceAll('.', ',');
    dynamic height = (pokemon.height / 10)
        .toStringAsFixed(1)
        .replaceAll('.', ',');

    final abilitiesList = pokemon.localizedAbilities(langCode);

    final firstAbility = abilitiesList.isNotEmpty
        ? abilitiesList.first[0].toUpperCase() +
              abilitiesList.first.substring(1)
        : '---';

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 2.2,
      children: [
        InfoItem(title: l10n.weight, value: "$weight kg", icon: Icons.scale),
        InfoItem(title: l10n.height, value: "$height m", icon: Icons.height),
        InfoItem(
          title: l10n.category,
          // Llamamos al método que ahora sí sabe cómo obtener la categoría
          value: pokemon.localizedCategory(langCode),
          icon: Icons.widgets,
        ),
        InfoItem(title: l10n.ability, value: firstAbility, icon: Icons.bolt),
      ],
    );
  }
}
