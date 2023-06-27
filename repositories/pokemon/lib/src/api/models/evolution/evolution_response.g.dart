// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionResponse _$EvolutionResponseFromJson(Map<String, dynamic> json) => EvolutionResponse(
      id: json['id'] as int,
      evolutionChain: json['chain'] == null ? null : EvolutionChain.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionResponseToJson(EvolutionResponse instance) => <String, dynamic>{
      'id': instance.id,
      'chain': instance.evolutionChain,
    };
