// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesResponse _$SpeciesResponseFromJson(Map<String, dynamic> json) => SpeciesResponse(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorTextEntries.fromJson(e as Map<String, dynamic>))
          .toList(),
      eggGroups:
          (json['egg_groups'] as List<dynamic>).map((e) => EggGroups.fromJson(e as Map<String, dynamic>)).toList(),
      habitat: Habitat.fromJson(json['habitat'] as Map<String, dynamic>),
      isBaby: json['is_baby'] as bool,
      isLegendary: json['is_legendary'] as bool,
      isMythical: json['is_mythical'] as bool,
    );

Map<String, dynamic> _$SpeciesResponseToJson(SpeciesResponse instance) => <String, dynamic>{
      'flavor_text_entries': instance.flavorTextEntries,
      'egg_groups': instance.eggGroups,
      'habitat': instance.habitat,
      'is_baby': instance.isBaby,
      'is_legendary': instance.isLegendary,
      'is_mythical': instance.isMythical,
    };
