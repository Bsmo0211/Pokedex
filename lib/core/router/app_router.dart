import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/presentation/providers/splash_provider.dart';
import 'package:pokedex/features/home/presentation/screens/main_screen.dart';
import 'package:pokedex/features/pokedex/presentation/screens/pokedex_screen.dart';
import 'package:pokedex/features/pokedex/presentation/screens/pokemon_details_screen.dart';
import 'package:pokedex/features/regions/presentation/screen/regions_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pokedex/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:pokedex/core/presentation/screens/splash_screen.dart';
import 'package:pokedex/features/onboarding/presentation/providers/onboarding_storage_provider.dart';
import 'package:flutter/material.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final onboardingStatus = ref.watch(onboardingStorageProvider);
  final delayStatus = ref.watch(splashDelayProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      if (onboardingStatus.isLoading || delayStatus.isLoading) return null;
      final bool isCompleted = onboardingStatus.value ?? false;
      if (state.matchedLocation == '/splash') {
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const PokedexScreen(),
                routes: [
                  GoRoute(
                    path: 'pokemon/:name',
                    builder: (context, state) {
                      String name = state.pathParameters['name']!;
                      return PokemonDetailsScreen(pokemonName: name);
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/regions',
                builder: (context, state) => const RegionScreen(),
              ),
            ],
          ),
          // RAMA 3: Favoritos
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: (context, state) =>
                    const Center(child: Text('Favoritos')),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) =>
                    const Center(child: Text('Perfil')),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
