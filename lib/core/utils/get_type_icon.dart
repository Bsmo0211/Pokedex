import 'package:flutter/material.dart';

class GetTypeIcon {
  static IconData getTypeIcon(String type) {
    switch (type) {
      case 'agua':
      case 'water':
        return Icons.water_drop;
      case 'fuego':
      case 'fire':
        return Icons.local_fire_department;
      case 'planta':
      case 'grass':
        return Icons.eco;
      case 'eléctrico':
      case 'electric':
        return Icons.bolt;
      case 'veneno':
      case 'poison':
        return Icons.auto_fix_normal;
      case 'roca':
      case 'rock':
        return Icons.landscape;
      case 'fantasma':
      case 'ghost':
        return Icons.visibility_off;
      case 'acero':
      case 'steel':
        return Icons.settings;
      case 'volador':
      case 'flying':
        return Icons.air;
      case 'hielo':
      case 'ice':
        return Icons.ac_unit;
      case 'hada':
      case 'fairy':
        return Icons.auto_awesome;
      default:
        return Icons.catching_pokemon;
    }
  }
}
