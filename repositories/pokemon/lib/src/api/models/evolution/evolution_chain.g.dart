// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) => EvolutionChain(
      evolutionDetails: EvolutionDetails.fromJson(json['evolves_to'] as Map<String, dynamic>),
      isBaby: json['is_baby'] as bool,
      species: PokemonGenerationItem.fromJson(json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) => <String, dynamic>{
      'evolves_to': instance.evolutionDetails,
      'is_baby': instance.isBaby,
      'species': instance.species,
    };
