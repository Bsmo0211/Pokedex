import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/get_type_colors.dart';
import 'package:pokedex/core/utils/get_type_icon.dart';

class TypeChip extends StatelessWidget {
  final String type;
  const TypeChip({required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: GetTypeColors.getTypeColor(type),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(GetTypeIcon.getTypeIcon(type), color: Colors.white, size: 12),
          const SizedBox(width: 4),
          Text(
            type.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
