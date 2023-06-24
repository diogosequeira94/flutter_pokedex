import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/src/api/models/species/egg_groups.dart';
import 'package:pokemon/src/api/models/species/flavor_text_entries.dart';
import 'package:pokemon/src/api/models/species/habitat.dart';

part 'species_response.g.dart';

@JsonSerializable()
class SpeciesResponse extends Equatable {
  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorTextEntries> flavorTextEntries;
  @JsonKey(name: 'egg_groups')
  final List<EggGroups> eggGroups;
  @JsonKey(name: 'habitat')
  final Habitat habitat;
  @JsonKey(name: 'is_baby')
  final bool isBaby;
  @JsonKey(name: 'is_legendary')
  final bool isLegendary;
  @JsonKey(name: 'is_mythical')
  final bool isMythical;

  const SpeciesResponse({
    required this.flavorTextEntries,
    required this.eggGroups,
    required this.habitat,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
  });

  @override
  List<Object?> get props => [
        flavorTextEntries,
        eggGroups,
        habitat,
        isBaby,
        isLegendary,
        isMythical,
      ];

  factory SpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeciesResponseFromJson(json);
}
