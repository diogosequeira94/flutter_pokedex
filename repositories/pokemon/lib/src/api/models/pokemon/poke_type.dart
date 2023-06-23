import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poke_type.g.dart';

@JsonSerializable()
class PokeType extends Equatable {
  @JsonKey(name: 'name')
  final String? name;

  const PokeType({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  factory PokeType.fromJson(Map<String, dynamic> json) => _$PokeTypeFromJson(json);
}
