// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evolution _$EvolutionFromJson(Map<String, dynamic> json) => Evolution(
      name: json['name'] as String?,
      id: json['id'] as String?,
      evolutions: (json['evolutions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      evolvedFrom: json['evolvedFrom'] as String?,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$EvolutionToJson(Evolution instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'evolutions': instance.evolutions,
      'evolvedFrom': instance.evolvedFrom,
      'reason': instance.reason,
    };
