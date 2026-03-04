import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/utils/get_type_colors.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/favorite_button.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/image_section.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/information_section.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    String mainType = widget.pokemon.types.first.toLowerCase();
    Color baseColor = GetTypeColors.getTypeColor(mainType);
    double scale = _isHovered ? 1.03 : 1.0;
    double elevation = _isHovered ? 15.0 : 4.0;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isHovered = true),
      onTapUp: (_) => setState(() => _isHovered = false),
      onTapCancel: () => setState(() => _isHovered = false),
      onTap: () => context.go('/home/pokemon/${widget.pokemon.name}'),

      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                baseColor.withValues(alpha: 0.2),
                baseColor.withValues(alpha: 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: baseColor.withValues(alpha: 0.3),
                blurRadius: elevation,
                offset: Offset(0, elevation / 2),
                spreadRadius: _isHovered ? 2 : 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                InformationSection(
                  baseColor: baseColor,
                  pokemon: widget.pokemon,
                ),

                ImageSection(
                  baseColor: baseColor,
                  pokemon: widget.pokemon,
                  isHovered: _isHovered,
                ),

                FavoriteButton(pokemon: widget.pokemon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
