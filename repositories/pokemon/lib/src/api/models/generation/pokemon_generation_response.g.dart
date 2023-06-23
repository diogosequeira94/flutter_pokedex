// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_generation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonGenerationResponse _$PokemonGenerationResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonGenerationResponse(
      count: json['count'] as int,
      pokemonItems: (json['results'] as List<dynamic>)
          .map((e) => PokemonGenerationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonGenerationResponseToJson(
        PokemonGenerationResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.pokemonItems,
    };
