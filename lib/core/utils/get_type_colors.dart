import 'package:flutter/material.dart';

class GetTypeColors {
  static const Map<String, Color> _colors = {
    'water': Color(0xFF5090D6),
    'dragon': Color(0xFF0B6DC3),
    'electric': Color(0xFFF4D23C),
    'fairy': Color(0xFFEC8FE6),
    'ghost': Color(0xFF5269AD),
    'fire': Color(0xFFFF9D55),
    'ice': Color(0xFF73CEC0),
    'grass': Color(0xFF63BC5A),
    'bug': Color(0xFF91C12F),
    'dark': Color(0xFF5A5366),
    'steel': Color(0xFF5A8EA2),
    'rock': Color(0xFFC5B78C),
    'poison': Color(0xFFB567CE),
    'psychic': Color(0xFFFA7179),
    'fighting': Color(0xFFCE416B),
    'ground': Color(0xFFD97845),
    'flying': Color(0xFF89AAE3),
    'normal': Color(0xFF919AA2),
  };

  static Color getTypeColor(String type) {
    return _colors[type.toLowerCase()] ?? const Color(0xFF919AA2);
  }
}
