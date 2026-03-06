// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get onboardingTitle1 => 'Todos los Pokémon en un solo lugar';

  @override
  String get onboardingDesc1 =>
      'Accede a una amplia lista de Pokémon de todas las generaciones creados por Nintendo';

  @override
  String get onboardingTitle2 => 'Mantén tu Pokédex actualizada';

  @override
  String get onboardingDesc2 =>
      'Regístrate y guarda tu perfil, Pokémon favoritos y mucho más en la aplicación';

  @override
  String get continueButton => 'Continuar';

  @override
  String get startButton => 'Empecemos';

  @override
  String get pokedexTitle => 'Pokédex';

  @override
  String get comingSoonTitle => '¡Muy Pronto Disponible!';

  @override
  String get comingSoonMessage =>
      'Estamos trabajando para traerte esta sección. Vuelve más adelante para descubrir todas las novedades.';

  @override
  String get errorTitle => 'Algo salió mal...';

  @override
  String get errorMessage =>
      'No pudimos cargar la información en este momento. Verifica tu conexión o intenta nuevamente más tarde.';

  @override
  String get retryButton => 'Reintentar';

  @override
  String get filterTitle => 'Filtra por tus preferencias';

  @override
  String get filterTypeLabel => 'Tipo';

  @override
  String get filterApply => 'Aplicar';

  @override
  String get filterCancel => 'Cancelar';

  @override
  String get searchHint => 'Buscar Pokémon...';

  @override
  String get noFavoritesTitle => 'No has marcado ningún Pokémon como favorito';

  @override
  String get noFavoritesMessage =>
      'Haz clic en el ícono de corazón de tus Pokémon favoritos y aparecerán aquí.';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String pokemonRemoved(String name) {
    return '$name eliminado de favoritos';
  }

  @override
  String get navPokedex => 'Pokedex';

  @override
  String get navRegions => 'Regiones';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navProfile => 'Perfil';

  @override
  String get typeBug => 'Bicho';

  @override
  String get typeDark => 'Siniestro';

  @override
  String get typeDragon => 'Dragón';

  @override
  String get typeElectric => 'Eléctrico';

  @override
  String get typeFairy => 'Hada';

  @override
  String get typeFighting => 'Lucha';

  @override
  String get typeFire => 'Fuego';

  @override
  String get typeFlying => 'Volador';

  @override
  String get typeGhost => 'Fantasma';

  @override
  String get typeGrass => 'Planta';

  @override
  String get typeGround => 'Tierra';

  @override
  String get typeIce => 'Hielo';

  @override
  String get typeNormal => 'Normal';

  @override
  String get typePoison => 'Veneno';

  @override
  String get typePsychic => 'Psíquico';

  @override
  String get typeRock => 'Roca';

  @override
  String get typeSteel => 'Acero';

  @override
  String get typeWater => 'Agua';

  @override
  String get height => 'ALTURA';

  @override
  String get weight => 'PESO';

  @override
  String get category => 'CATEGORÍA';

  @override
  String get ability => 'HABILIDAD';

  @override
  String get gender => 'GÉNERO';

  @override
  String get weaknesses => 'Debilidades';

  @override
  String get noGender => 'Sin género';

  @override
  String get profileTitle => 'Perfil de Entrenador';

  @override
  String get nameLabel => 'Nombre del Entrenador';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get nameRequired => 'El nombre es obligatorio';

  @override
  String get invalidEmail => 'Introduce un correo válido';
}
