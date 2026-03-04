import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.catching_pokemon),
            label: l10n.navPokedex,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            label: l10n.navRegions,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            label: l10n.navFavorites,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: l10n.navProfile,
          ),
        ],
      ),
    );
  }
}
