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
      abilitiesEn:
          (json['abilitiesEn'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      abilitiesEs:
          (json['abilitiesEs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      descriptionEn: json['descriptionEn'] as String? ?? '',
      descriptionEs: json['descriptionEs'] as String? ?? '',
      weaknesses:
          (json['weaknesses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      categoryEn: json['categoryEn'] as String? ?? '',
      categoryEs: json['categoryEs'] as String? ?? '',
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
      'abilitiesEn': instance.abilitiesEn,
      'abilitiesEs': instance.abilitiesEs,
      'descriptionEn': instance.descriptionEn,
      'descriptionEs': instance.descriptionEs,
      'weaknesses': instance.weaknesses,
      'categoryEn': instance.categoryEn,
      'categoryEs': instance.categoryEs,
      'malePercentage': instance.malePercentage,
      'femalePercentage': instance.femalePercentage,
      'isGenderless': instance.isGenderless,
    };
