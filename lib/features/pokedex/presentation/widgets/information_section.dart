import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/type_chip.dart';

class InformationSection extends StatelessWidget {
  final Color baseColor;
  final Pokemon pokemon;
  const InformationSection({
    super.key,
    required this.pokemon,
    required this.baseColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'N°${pokemon.id.toString().padLeft(3, '0')}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: baseColor.withValues(alpha: 0.7),
            ),
          ),
          Text(
            pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2D2D),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: pokemon.types
                .map((type) => TypeChip(type: type))
                .toList(),
          ),
        ],
      ),
    );
  }
}
