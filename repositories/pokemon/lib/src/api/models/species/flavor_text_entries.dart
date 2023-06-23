import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flavor_text_entries.g.dart';

@JsonSerializable()
class FlavorTextEntries extends Equatable {
  @JsonKey(name: 'flavor_text')
  final String flavorText;

  const FlavorTextEntries({
    required this.flavorText,
  });

  @override
  List<Object?> get props => [flavorText];

  factory FlavorTextEntries.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntriesFromJson(json);
}


