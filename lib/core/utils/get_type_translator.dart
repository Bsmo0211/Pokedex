import 'package:flutter/material.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class TypeTranslator {
  static String translate(BuildContext context, String type) {
    AppLocalizations l10n = AppLocalizations.of(context)!;

    final Map<String, String> typeMap = {
      'bug': l10n.typeBug,
      'dark': l10n.typeDark,
      'dragon': l10n.typeDragon,
      'electric': l10n.typeElectric,
      'fairy': l10n.typeFairy,
      'fighting': l10n.typeFighting,
      'fire': l10n.typeFire,
      'flying': l10n.typeFlying,
      'ghost': l10n.typeGhost,
      'grass': l10n.typeGrass,
      'ground': l10n.typeGround,
      'ice': l10n.typeIce,
      'normal': l10n.typeNormal,
      'poison': l10n.typePoison,
      'psychic': l10n.typePsychic,
      'rock': l10n.typeRock,
      'steel': l10n.typeSteel,
      'water': l10n.typeWater,
    };

    return typeMap[type.toLowerCase()] ?? type.toUpperCase();
  }
}
