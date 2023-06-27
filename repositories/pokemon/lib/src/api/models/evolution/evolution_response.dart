import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/api/models/evolution/evolution_chain.dart';

part 'evolution_response.g.dart';

@JsonSerializable()
class EvolutionResponse extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'chain')
  final EvolutionChain? evolutionChain;

  const EvolutionResponse({
    required this.id,
    required this.evolutionChain,
  });

  @override
  List<Object?> get props => [
        id,
        evolutionChain,
      ];

  factory EvolutionResponse.fromJson(Map<String, dynamic> json) => _$EvolutionResponseFromJson(json);
}
