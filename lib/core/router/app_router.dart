import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/presentation/providers/splash_provider.dart';
import 'package:pokedex/features/home/presentation/screens/main_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokedex/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:pokedex/core/presentation/screens/splash_screen.dart';
import 'package:pokedex/features/onboarding/presentation/providers/onboarding_storage_provider.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final onboardingStatus = ref.watch(onboardingStorageProvider);
  final delayStatus = ref.watch(splashDelayProvider);

  return GoRouter(
    initialLocation: '/splash',

    redirect: (context, state) {
      if (onboardingStatus.isLoading || delayStatus.isLoading) {
        return null;
      }

      final bool isCompleted = onboardingStatus.value ?? false;
      final bool isAtSplash = state.matchedLocation == '/splash';

      if (isAtSplash) {
        return isCompleted ? '/home' : '/onboarding';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(path: '/home', builder: (context, state) => const MainScreen()),

      // Ejemplo de sub-navegación (Detalle de un Pokémon)
      // Esta ruta se abre "encima" de la MainScreen cubriendo la barra
      /* GoRoute(
        path: '/pokemon/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PokemonDetailScreen(id: id); // Pantalla de detalle
        },
      ), */
    ],
  );
}
