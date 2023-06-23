import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ability.g.dart';

@JsonSerializable()
class Ability extends Equatable {
  @JsonKey(name: 'name')
  final String? name;

  const Ability({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
