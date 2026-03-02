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
}
