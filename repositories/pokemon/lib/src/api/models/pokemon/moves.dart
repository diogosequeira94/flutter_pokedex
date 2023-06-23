import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/pokemon.dart';

part 'moves.g.dart';

@JsonSerializable()
class Moves extends Equatable {
  @JsonKey(name: 'move')
  final Move? move;

  const Moves({
    required this.move,
  });

  @override
  List<Object?> get props => [move];

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
