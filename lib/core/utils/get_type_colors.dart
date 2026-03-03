import 'package:flutter/material.dart';

class GetTypeColors {
  static Color getTypeColor(String type) {
    switch (type) {
      case 'agua':
      case 'water':
        return const Color(0xFF5090D6);
      case 'dragón':
      case 'dragon':
        return const Color(0xFF0B6DC3);
      case 'eléctrico':
      case 'electric':
        return const Color(0xFFF4D23C);
      case 'hada':
      case 'fairy':
        return const Color(0xFFEC8FE6);
      case 'fantasma':
      case 'ghost':
        return const Color(0xFF5269AD);
      case 'fuego':
      case 'fire':
        return const Color(0xFFFF9D55);
      case 'hielo':
      case 'ice':
        return const Color(0xFF73CEC0);
      case 'planta':
      case 'grass':
        return const Color(0xFF63BC5A);
      case 'bicho':
      case 'bug':
        return const Color(0xFF91C12F);
      case 'normal':
        return const Color(0xFF919AA2);
      case 'siniestro':
      case 'dark':
        return const Color(0xFF5A5366);
      case 'acero':
      case 'steel':
        return const Color(0xFF5A8EA2);
      case 'roca':
      case 'rock':
        return const Color(0xFFC5B78C);
      case 'veneno':
      case 'poison':
        return const Color(0xFFB567CE);
      case 'psíquico':
      case 'psychic':
        return const Color(0xFFFA7179);
      case 'lucha':
      case 'fighting':
        return const Color(0xFFCE416B);
      case 'tierra':
      case 'ground':
        return const Color(0xFFD97845);
      case 'volador':
      case 'flying':
        return const Color(0xFF89AAE3);
      default:
        return const Color(0xFF919AA2);
    }
  }
}
