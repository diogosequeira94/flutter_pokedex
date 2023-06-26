import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'egg_groups.g.dart';

@JsonSerializable()
class EggGroups extends Equatable {
  @JsonKey(name: 'name')
  final String name;

  const EggGroups({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  factory EggGroups.fromJson(Map<String, dynamic> json) => _$EggGroupsFromJson(json);
}
