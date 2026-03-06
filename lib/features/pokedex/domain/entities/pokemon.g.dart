// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      weight: (json['weight'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String? ?? '',
      weaknesses:
          (json['weaknesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      category: json['category'] as String? ?? '',
      malePercentage: (json['malePercentage'] as num?)?.toDouble() ?? 0.0,
      femalePercentage: (json['femalePercentage'] as num?)?.toDouble() ?? 0.0,
      isGenderless: json['isGenderless'] as bool? ?? false,
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'types': instance.types,
      'weight': instance.weight,
      'height': instance.height,
      'abilities': instance.abilities,
      'description': instance.description,
      'weaknesses': instance.weaknesses,
      'category': instance.category,
      'malePercentage': instance.malePercentage,
      'femalePercentage': instance.femalePercentage,
      'isGenderless': instance.isGenderless,
    };
