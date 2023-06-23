part of 'pokemon_cubit.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitial extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonInformationInProgress extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonInformationSuccess extends PokemonState {
  final Pokemon pokemon;
  const PokemonInformationSuccess({required this.pokemon});
  @override
  List<Object> get props => [pokemon];
}

class PokemonInformationFailure extends PokemonState {
  final String errorMessage;
  const PokemonInformationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
