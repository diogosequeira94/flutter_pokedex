// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moves.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Moves _$MovesFromJson(Map<String, dynamic> json) => Moves(
      move: json['move'] == null
          ? null
          : Move.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'move': instance.move,
    };
