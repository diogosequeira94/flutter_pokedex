import 'package:equatable/equatable.dart';

class PokemonBasicItem extends Equatable {
  final String name;
  final int number;

  const PokemonBasicItem({
    required this.name,
    required this.number,
  });

  @override
  List<Object?> get props => [
        name,
        number,
      ];

  PokemonBasicItem copyWith({
    String? name,
    int? number,
  }) {
    return PokemonBasicItem(
      name: name ?? this.name,
      number: number ?? this.number,
    );
  }
}
