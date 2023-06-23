import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habitat.g.dart';

@JsonSerializable()
class Habitat extends Equatable {
  @JsonKey(name: 'namne')
  final String name;

  const Habitat({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  factory Habitat.fromJson(Map<String, dynamic> json) =>
      _$HabitatFromJson(json);
}


