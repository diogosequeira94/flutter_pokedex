import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'evolution.g.dart';

@JsonSerializable()
class Evolution extends Equatable {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @JsonKey(name: 'evolutions')
  final List<String>? evolutions;
  @JsonKey(name: 'evolvedFrom')
  final String? evolvedFrom;
  @JsonKey(name: 'reason')
  final String reason;

  const Evolution({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.evolutions,
    required this.evolvedFrom,
    required this.reason,
  });

  @override
  List<Object?> get props => [name, id, imageUrl, evolutions, evolvedFrom, reason];

  factory Evolution.fromJson(Map<String, dynamic> json) => _$EvolutionFromJson(json);
}
