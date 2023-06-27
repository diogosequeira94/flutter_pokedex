import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evolution.g.dart';

@JsonSerializable()
class Evolution extends Equatable {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'evolutions')
  final List<String>? evolutions;
  @JsonKey(name: 'reason')
  final String reason;

  const Evolution({
    required this.name,
    required this.id,
    required this.evolutions,
    required this.reason,
  });

  @override
  List<Object?> get props => [name, id, evolutions, reason];

  factory Evolution.fromJson(Map<String, dynamic> json) => _$EvolutionFromJson(json);
}
