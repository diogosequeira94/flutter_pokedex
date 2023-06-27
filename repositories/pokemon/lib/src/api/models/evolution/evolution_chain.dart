import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/api/models/evolution/evolution_details.dart';

import '../generation/pokemon_generation_item.dart';

part 'evolution_chain.g.dart';

@JsonSerializable()
class EvolutionChain extends Equatable {
  @JsonKey(name: 'evolves_to')
  final EvolutionDetails evolutionDetails;
  @JsonKey(name: 'is_baby')
  final bool isBaby;
  @JsonKey(name: 'species')
  final PokemonGenerationItem species;

  const EvolutionChain({
    required this.evolutionDetails,
    required this.isBaby,
    required this.species,
  });

  @override
  List<Object?> get props => [evolutionDetails, isBaby, species];

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => _$EvolutionChainFromJson(json);
}
