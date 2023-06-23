import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/pokemon.dart';

part 'abilities.g.dart';

@JsonSerializable()
class Abilities extends Equatable {
  @JsonKey(name: 'ability')
  final Ability? ability;
  @JsonKey(name: 'is_hidden')
  final bool? isHidden;


  const Abilities({
    required this.ability,
    required this.isHidden,
  });

  @override
  List<Object?> get props => [ability, isHidden];

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
}
