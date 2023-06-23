import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat extends Equatable {
  @JsonKey(name: 'name')
  final String? name;

  const Stat({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}
