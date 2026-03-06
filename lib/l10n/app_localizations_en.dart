// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onboardingTitle1 => 'All Pokémon in one place';

  @override
  String get onboardingDesc1 =>
      'Access a wide list of Pokémon from all generations created by Nintendo';

  @override
  String get onboardingTitle2 => 'Keep your Pokédex updated';

  @override
  String get onboardingDesc2 =>
      'Sign up and save your profile, favorite Pokémon and much more in the app';

  @override
  String get continueButton => 'Continue';

  @override
  String get startButton => 'Let\'s Start';

  @override
  String get pokedexTitle => 'Pokédex';

  @override
  String get comingSoonTitle => 'Coming Soon!';

  @override
  String get comingSoonMessage =>
      'We are working hard to bring you this section. Check back later to discover all the new features.';

  @override
  String get errorTitle => 'Something went wrong...';

  @override
  String get errorMessage =>
      'We couldn\'t load the information at this time. Please check your connection or try again later.';

  @override
  String get retryButton => 'Retry';

  @override
  String get filterTitle => 'Filter by your preferences';

  @override
  String get filterTypeLabel => 'Type';

  @override
  String get filterApply => 'Apply';

  @override
  String get filterCancel => 'Cancel';

  @override
  String get searchHint => 'Search Pokémon...';

  @override
  String get noFavoritesTitle => 'You haven\'t marked any Pokémon as favorites';

  @override
  String get noFavoritesMessage =>
      'Click on the heart icon of your favorite Pokémon and they will appear here.';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String pokemonRemoved(String name) {
    return '$name removed from favorites';
  }

  @override
  String get navPokedex => 'Pokedex';

  @override
  String get navRegions => 'Regions';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navProfile => 'Profile';

  @override
  String get typeBug => 'Bug';

  @override
  String get typeDark => 'Dark';

  @override
  String get typeDragon => 'Dragon';

  @override
  String get typeElectric => 'Electric';

  @override
  String get typeFairy => 'Fairy';

  @override
  String get typeFighting => 'Fighting';

  @override
  String get typeFire => 'Fire';

  @override
  String get typeFlying => 'Flying';

  @override
  String get typeGhost => 'Ghost';

  @override
  String get typeGrass => 'Grass';

  @override
  String get typeGround => 'Ground';

  @override
  String get typeIce => 'Ice';

  @override
  String get typeNormal => 'Normal';

  @override
  String get typePoison => 'Poison';

  @override
  String get typePsychic => 'Psychic';

  @override
  String get typeRock => 'Rock';

  @override
  String get typeSteel => 'Steel';

  @override
  String get typeWater => 'Water';

  @override
  String get height => 'HEIGHT';

  @override
  String get weight => 'WEIGHT';

  @override
  String get category => 'CATEGORY';

  @override
  String get ability => 'ABILITY';

  @override
  String get gender => 'GENDER';

  @override
  String get weaknesses => 'Weaknesses';

  @override
  String get noGender => 'Genderless';
}
