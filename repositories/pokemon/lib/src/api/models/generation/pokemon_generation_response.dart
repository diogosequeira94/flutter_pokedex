import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/api/models/generation/pokemon_generation_item.dart';

part 'pokemon_generation_response.g.dart';

@JsonSerializable()
class PokemonGenerationResponse extends Equatable {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'results')
  final List<PokemonGenerationItem> pokemonItems;

  const PokemonGenerationResponse({
    required this.count,
    required this.pokemonItems,
  });

  @override
  List<Object?> get props => [count, pokemonItems];

  factory PokemonGenerationResponse.fromJson(Map<String, dynamic> json) => _$PokemonGenerationResponseFromJson(json);
}
