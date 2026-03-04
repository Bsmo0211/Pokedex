import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/utils/get_type_colors.dart';
import 'package:pokedex/core/utils/get_type_icon.dart';
import 'package:pokedex/core/utils/get_type_translator.dart';

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
          SvgPicture.asset(
            GetTypeSvg.getTypeSvg(type),
            width: 10,
            height: 10,

            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          Text(
            TypeTranslator.translate(context, type),
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
