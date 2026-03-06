import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required String imageUrl,
    required List<String> types,
    required int weight,
    required int height,
    required List<String> abilities,
    @Default('') String description,
    @Default([]) List<String> weaknesses,
    @Default('') String category,
    @Default(0.0) double malePercentage,
    @Default(0.0) double femalePercentage,
    @Default(false) bool isGenderless,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
