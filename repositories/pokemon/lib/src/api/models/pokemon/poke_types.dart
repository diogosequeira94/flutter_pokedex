import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/pokemon.dart';

part 'poke_types.g.dart';

@JsonSerializable()
class PokeTypes extends Equatable {
  @JsonKey(name: 'type')
  final PokeType? type;

  const PokeTypes({
    required this.type,
  });

  @override
  List<Object?> get props => [type];

  factory PokeTypes.fromJson(Map<String, dynamic> json) => _$PokeTypesFromJson(json);
}
