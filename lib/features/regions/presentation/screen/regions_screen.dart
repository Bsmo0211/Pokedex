import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegionScreen extends ConsumerStatefulWidget {
  const RegionScreen({super.key});

  @override
  ConsumerState<RegionScreen> createState() => _RegionScreenState();
}

class _RegionScreenState extends ConsumerState<RegionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/construccion_page.png', width: 220),

          const Text(
            '¡Muy Pronto Disponible!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Text(
              'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.4, // Mejora la lectura
              ),
            ),
          ),
        ],
      ),
    );
  }
}
