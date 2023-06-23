import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'move.g.dart';

@JsonSerializable()
class Move extends Equatable {
  @JsonKey(name: 'name')
  final String? name;

  const Move({
    required this.name,
  });

  @override
  List<Object?> get props => [name];

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}
