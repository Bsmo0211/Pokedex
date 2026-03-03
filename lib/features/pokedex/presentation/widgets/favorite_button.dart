import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.2),
          border: Border.all(color: Colors.white54, width: 1.5),
        ),
        child: const Icon(Icons.favorite_border, color: Colors.white, size: 16),
      ),
    );
  }
}
