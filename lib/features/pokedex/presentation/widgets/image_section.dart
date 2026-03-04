import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/core/utils/get_type_icon.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';

class ImageSection extends StatelessWidget {
  final Color baseColor;
  final Pokemon pokemon;
  final bool isHovered;
  const ImageSection({
    super.key,
    required this.pokemon,
    required this.baseColor,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -10,
      top: -10,
      bottom: -10,
      child: Container(
        width: 145,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [baseColor, baseColor.withValues(alpha: 0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedRotation(
              turns: isHovered ? 0.05 : 0,
              duration: const Duration(milliseconds: 300),
              child: Opacity(
                opacity: 0.5,
                child: SvgPicture.asset(
                  GetTypeSvg.getTypeSvg(pokemon.types.first),
                  width: 100,
                  height: 100,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),

            Hero(
              tag: pokemon.id,
              child: Image.network(
                pokemon.imageUrl,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
