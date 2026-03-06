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
      description: json['description'] as String,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      category: json['category'] as String,
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'types': instance.types,
      'weight': instance.weight,
      'height': instance.height,
      'description': instance.description,
      'abilities': instance.abilities,
      'weaknesses': instance.weaknesses,
      'category': instance.category,
    };
