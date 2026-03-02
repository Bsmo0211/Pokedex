import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokedex/features/onboarding/domain/entities/onboarding_item.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingItem item;
  final int index;

  const OnboardingPageContent({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
              item.imagePath,
              height: 400,
              width: double.infinity,
              fit: BoxFit.contain,
            )
            .animate(key: ValueKey('img_$index'))
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2, end: 0, curve: Curves.easeOutQuad),

        const SizedBox(height: 40),

        Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )
            .animate(key: ValueKey('title_$index'))
            .fadeIn(delay: 300.ms, duration: 400.ms)
            .shimmer(blendMode: BlendMode.srcOver, color: Colors.white70),

        const SizedBox(height: 20),

        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
            .animate(key: ValueKey('desc_$index'))
            .fadeIn(delay: 400.ms)
            .move(begin: const Offset(0, 20), end: Offset.zero),
      ],
    );
  }
}
