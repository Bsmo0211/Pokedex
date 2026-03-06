import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const Pokemon._();

  const factory Pokemon({
    required int id,
    required String name,
    required String imageUrl,
    required List<String> types,
    required int weight,
    required int height,
    @Default([]) List<String> abilitiesEn,
    @Default([]) List<String> abilitiesEs,
    @Default('') String descriptionEn,
    @Default('') String descriptionEs,
    @Default([]) List<String> weaknesses,
    @Default('') String categoryEn,
    @Default('') String categoryEs,
    @Default(0.0) double malePercentage,
    @Default(0.0) double femalePercentage,
    @Default(false) bool isGenderless,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  String localizedDescription(String languageCode) {
    return languageCode == 'es' ? descriptionEs : descriptionEn;
  }

  List<String> localizedAbilities(String languageCode) {
    return languageCode == 'es' ? abilitiesEs : abilitiesEn;
  }

  String localizedCategory(String languageCode) {
    return languageCode == 'es' ? categoryEs : categoryEn;
  }
}
