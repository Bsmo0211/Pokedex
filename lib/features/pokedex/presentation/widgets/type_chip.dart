import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/utils/get_type_colors.dart';
import 'package:pokedex/core/utils/get_type_icon.dart';
import 'package:pokedex/core/utils/get_type_translator.dart';

class TypeChip extends StatelessWidget {
  final String type;
  final double fontSize;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;

  const TypeChip({
    required this.type,
    super.key,
    this.fontSize = 12,
    this.iconSize = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: GetTypeColors.getTypeColor(type),
        // Si no pasas un borde, usa 20 por defecto
        borderRadius: borderRadius ?? BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            GetTypeSvg.getTypeSvg(type),
            width: iconSize,
            height: iconSize,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 6),
          Text(
            TypeTranslator.translate(context, type),
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
