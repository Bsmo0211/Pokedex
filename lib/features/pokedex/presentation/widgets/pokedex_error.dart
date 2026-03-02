import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/change_color_image_error.dart';

class PokedexErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const PokedexErrorWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.matrix(
              ChangeColorImageError.changeColor,
            ),
            child: Image.asset('assets/images/magikarp_error.png', width: 220),
          ),

          const Text(
            'Algo salió mal...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D2D2D),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Text(
              'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                height: 1.4, // Mejora la lectura
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 60, // Botón un poco más robusto
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  elevation: 0, // En el diseño se ve plano/moderno
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Reintentar',
                  style: TextStyle(
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
