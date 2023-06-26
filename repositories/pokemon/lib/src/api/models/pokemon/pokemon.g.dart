// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      description: json['description'] as String?,
      habitat: json['habitat'] as String?,
      abilities:
          (json['abilities'] as List<dynamic>).map((e) => Abilities.fromJson(e as Map<String, dynamic>)).toList(),
      moves: (json['moves'] as List<dynamic>).map((e) => Moves.fromJson(e as Map<String, dynamic>)).toList(),
      types: (json['types'] as List<dynamic>).map((e) => PokeTypes.fromJson(e as Map<String, dynamic>)).toList(),
      stats: (json['stats'] as List<dynamic>).map((e) => Stats.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'description': instance.description,
      'habitat': instance.habitat,
      'abilities': instance.abilities,
      'moves': instance.moves,
      'types': instance.types,
      'stats': instance.stats,
    };
