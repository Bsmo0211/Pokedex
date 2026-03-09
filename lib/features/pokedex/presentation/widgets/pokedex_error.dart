import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/assets_constants.dart';
import 'package:pokedex/core/utils/change_color_image_error.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class PokedexErrorWidget extends StatelessWidget {
  final String title;
  final String massage;
  final VoidCallback? onRetry;
  final bool needButton;

  const PokedexErrorWidget({
    super.key,
    this.onRetry,
    required this.title,
    required this.massage,
    required this.needButton,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.matrix(
              ChangeColorImageError.changeColor,
            ),
            child: Image.asset(
              '${AssetsManager.imagesPath}magikarp_error.png',
              width: 220,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Text(
              massage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
          if (needButton)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    l10n.retryButton,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
