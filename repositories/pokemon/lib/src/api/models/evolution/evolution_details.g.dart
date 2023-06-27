// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionDetails _$EvolutionDetailsFromJson(Map<String, dynamic> json) => EvolutionDetails(
      minLevel: json['min_level'] as int,
      subEvolution:
          json['evolves_to'] == null ? null : EvolutionChain.fromJson(json['evolves_to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionDetailsToJson(EvolutionDetails instance) => <String, dynamic>{
      'min_level': instance.minLevel,
      'evolves_to': instance.subEvolution,
    };
