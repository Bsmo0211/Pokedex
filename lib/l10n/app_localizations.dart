import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Título de la primera pantalla de bienvenida
  ///
  /// In es, this message translates to:
  /// **'Todos los Pokémon en un solo lugar'**
  String get onboardingTitle1;

  /// Descripción de la primera pantalla de bienvenida
  ///
  /// In es, this message translates to:
  /// **'Accede a una amplia lista de Pokémon de todas las generaciones creados por Nintendo'**
  String get onboardingDesc1;

  /// Título de la segunda pantalla de bienvenida
  ///
  /// In es, this message translates to:
  /// **'Mantén tu Pokédex actualizada'**
  String get onboardingTitle2;

  /// Descripción de la segunda pantalla de bienvenida
  ///
  /// In es, this message translates to:
  /// **'Regístrate y guarda tu perfil, Pokémon favoritos y mucho más en la aplicación'**
  String get onboardingDesc2;

  /// Texto del botón para avanzar de página
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get continueButton;

  /// Texto del botón final del tutorial
  ///
  /// In es, this message translates to:
  /// **'Empecemos'**
  String get startButton;

  /// Título principal de la lista de Pokémon
  ///
  /// In es, this message translates to:
  /// **'Pokédex'**
  String get pokedexTitle;

  /// No description provided for @comingSoonTitle.
  ///
  /// In es, this message translates to:
  /// **'¡Muy Pronto Disponible!'**
  String get comingSoonTitle;

  /// No description provided for @comingSoonMessage.
  ///
  /// In es, this message translates to:
  /// **'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.'**
  String get comingSoonMessage;

  /// No description provided for @errorTitle.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal...'**
  String get errorTitle;

  /// No description provided for @errorMessage.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.'**
  String get errorMessage;

  /// No description provided for @retryButton.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retryButton;

  /// No description provided for @filterTitle.
  ///
  /// In es, this message translates to:
  /// **'Filtra por tus preferencias'**
  String get filterTitle;

  /// No description provided for @filterTypeLabel.
  ///
  /// In es, this message translates to:
  /// **'Tipo'**
  String get filterTypeLabel;

  /// No description provided for @filterApply.
  ///
  /// In es, this message translates to:
  /// **'Aplicar'**
  String get filterApply;

  /// No description provided for @filterCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get filterCancel;

  /// No description provided for @searchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar Pokémon...'**
  String get searchHint;

  /// No description provided for @noFavoritesTitle.
  ///
  /// In es, this message translates to:
  /// **'No has marcado ningún Pokémon como favorito'**
  String get noFavoritesTitle;

  /// No description provided for @noFavoritesMessage.
  ///
  /// In es, this message translates to:
  /// **'Haz clic en el ícono de corazón de tus Pokémon favoritos y aparecerán aquí.'**
  String get noFavoritesMessage;

  /// No description provided for @favoritesTitle.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get favoritesTitle;

  /// Mensaje mostrado al eliminar un pokemon
  ///
  /// In es, this message translates to:
  /// **'{name} eliminado de favoritos'**
  String pokemonRemoved(String name);

  /// No description provided for @navPokedex.
  ///
  /// In es, this message translates to:
  /// **'Pokedex'**
  String get navPokedex;

  /// No description provided for @navRegions.
  ///
  /// In es, this message translates to:
  /// **'Regiones'**
  String get navRegions;

  /// No description provided for @navFavorites.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get navFavorites;

  /// No description provided for @navProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get navProfile;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Bicho'**
  String get typeBug;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Siniestro'**
  String get typeDark;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Dragón'**
  String get typeDragon;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Eléctrico'**
  String get typeElectric;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Hada'**
  String get typeFairy;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Lucha'**
  String get typeFighting;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Fuego'**
  String get typeFire;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Volador'**
  String get typeFlying;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Fantasma'**
  String get typeGhost;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Planta'**
  String get typeGrass;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Tierra'**
  String get typeGround;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Hielo'**
  String get typeIce;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Normal'**
  String get typeNormal;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Veneno'**
  String get typePoison;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Psíquico'**
  String get typePsychic;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Roca'**
  String get typeRock;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Acero'**
  String get typeSteel;

  /// Color
  ///
  /// In es, this message translates to:
  /// **'Agua'**
  String get typeWater;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
