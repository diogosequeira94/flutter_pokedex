import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/api/models/evolution/evolution_chain.dart';

part 'evolution_details.g.dart';

@JsonSerializable()
class EvolutionDetails extends Equatable {
  @JsonKey(name: 'min_level')
  final int minLevel;
  @JsonKey(name: 'evolves_to')
  final EvolutionChain? subEvolution;

  const EvolutionDetails({
    required this.minLevel,
    required this.subEvolution,
  });

  @override
  List<Object?> get props => [
        minLevel,
        subEvolution,
      ];

  factory EvolutionDetails.fromJson(Map<String, dynamic> json) => _$EvolutionDetailsFromJson(json);
}
