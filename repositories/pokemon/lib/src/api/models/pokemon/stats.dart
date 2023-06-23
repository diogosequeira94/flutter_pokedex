import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon/pokemon.dart';

part 'stats.g.dart';

@JsonSerializable()
class Stats extends Equatable {
  @JsonKey(name: 'base_stat')
  final int? value;
  @JsonKey(name: 'stat')
  final Stat? stat;

  const Stats({
    required this.value,
    required this.stat,
  });

  @override
  List<Object?> get props => [stat];

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
