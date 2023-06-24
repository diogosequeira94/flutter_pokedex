import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/pokemon.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon extends Equatable {
  @JsonKey(name: 'height')
  final int? height;
  @JsonKey(name: 'weight')
  final int? weight;

  /// ToDo: Move to UI Model
  final String? description;
  final String? habitat;
  @JsonKey(name: 'abilities')
  final List<Abilities> abilities;
  @JsonKey(name: 'moves')
  final List<Moves> moves;
  @JsonKey(name: 'types')
  final List<PokeTypes> types;
  @JsonKey(name: 'stats')
  final List<Stats> stats;

  const Pokemon({
    required this.height,
    required this.weight,
    this.description,
    this.habitat,
    required this.abilities,
    required this.moves,
    required this.types,
    required this.stats,
  });

  @override
  List<Object?> get props => [
        height,
        weight,
        description,
        habitat,
        abilities,
        moves,
        types,
        stats,
      ];

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  Pokemon copyWith({
    int? height,
    int? weight,
    String? description,
    String? habitat,
    List<Abilities>? abilities,
    List<Moves>? moves,
    List<Stats>? stats,
    List<PokeTypes>? types,
  }) {
    return Pokemon(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      description: description ?? this.description,
      habitat: habitat ?? this.habitat,
      abilities: abilities ?? this.abilities,
      moves: moves ?? this.moves,
      stats: stats ?? this.stats,
      types: types ?? this.types,
    );
  }
}
