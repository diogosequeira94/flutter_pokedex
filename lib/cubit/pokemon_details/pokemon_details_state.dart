part of 'pokemon_details_cubit.dart';

abstract class PokemonDetails extends Equatable {
  const PokemonDetails();
}

class PokemonInitial extends PokemonDetails {
  @override
  List<Object> get props => [];
}

class PokemonInformationInProgress extends PokemonDetails {
  @override
  List<Object> get props => [];
}

class PokemonInformationSuccess extends PokemonDetails {
  final Pokemon pokemon;
  const PokemonInformationSuccess({required this.pokemon});
  @override
  List<Object> get props => [pokemon];
}

class PokemonInformationFailure extends PokemonDetails {
  final String errorMessage;
  const PokemonInformationFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
