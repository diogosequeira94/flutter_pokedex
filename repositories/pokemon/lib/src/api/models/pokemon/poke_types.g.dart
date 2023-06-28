// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokeTypes _$PokeTypesFromJson(Map<String, dynamic> json) => PokeTypes(
      type: json['type'] == null ? null : PokeType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokeTypesToJson(PokeTypes instance) => <String, dynamic>{
      'type': instance.type,
    };
