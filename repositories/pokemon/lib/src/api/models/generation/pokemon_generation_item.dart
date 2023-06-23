import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_generation_item.g.dart';

@JsonSerializable()
class PokemonGenerationItem extends Equatable {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'url')
  final String url;

  const PokemonGenerationItem({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];

  factory PokemonGenerationItem.fromJson(Map<String, dynamic> json) => _$PokemonGenerationItemFromJson(json);
}
