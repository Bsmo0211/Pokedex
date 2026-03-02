import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required String imageUrl,
    required List<String> types,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl:
          json['sprites']?['other']?['official-artwork']?['front_default']
              as String? ??
          '',
      types:
          (json['types'] as List<dynamic>?)
              ?.map((e) => e['type']['name'] as String)
              .toList() ??
          [],
    );
  }
}
