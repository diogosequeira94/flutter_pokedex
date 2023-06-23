// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      ability: json['ability'] == null
          ? null
          : Ability.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool?,
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
    };
