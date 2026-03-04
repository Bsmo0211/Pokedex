import 'package:pokedex/core/utils/assets_constants.dart';

class GetTypeSvg {
  static const _validTypes = {
    'bug',
    'dark',
    'dragon',
    'electric',
    'fairy',
    'fighting',
    'fire',
    'flying',
    'ghost',
    'grass',
    'ground',
    'ice',
    'normal',
    'poison',
    'psychic',
    'rock',
    'steel',
    'water',
  };

  static String getTypeSvg(String type) {
    String typeName = type.toLowerCase();

    if (_validTypes.contains(typeName)) {
      return '${AssetsManager.svgPath}$typeName.svg';
    }

    return '${AssetsManager.svgPath}normal.svg';
  }
}
