part of 'pokemon_details_cubit.dart';

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();
}

class PokemonInitial extends PokemonDetailsState {
  @override
  List<Object> get props => [];
}

class PokemonInformationInProgress extends PokemonDetailsState {
  @override
  List<Object> get props => [];
}

class PokemonInformationSuccess extends PokemonDetailsState {
  final Pokemon pokemon;
  const PokemonInformationSuccess({required this.pokemon});
  @override
  List<Object> get props => [pokemon];
}

class PokemonInformationFailure extends PokemonDetailsState {
  final String errorMessage;
  const PokemonInformationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
