part of 'pokemon_details_cubit.dart';

abstract class PokemonDetailsState extends Equatable {
  const PokemonDetailsState();
}

class PokemonDetailsInitial extends PokemonDetailsState {
  @override
  List<Object> get props => [];
}

class PokemonDetailsInProgress extends PokemonDetailsState {
  @override
  List<Object> get props => [];
}

class PokemonDetailsSuccess extends PokemonDetailsState {
  final Pokemon pokemon;
  const PokemonDetailsSuccess({required this.pokemon});
  @override
  List<Object> get props => [pokemon];
}

class PokemonDetailsFailure extends PokemonDetailsState {
  final String errorMessage;
  const PokemonDetailsFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class PokemonEvolutionDetailsInProgress extends PokemonDetailsState {
  @override
  List<Object> get props => [];
}

class PokemonEvolutionDetailsSuccess extends PokemonDetailsSuccess {
  final Evolution evolutionChain;
  const PokemonEvolutionDetailsSuccess({
    required this.evolutionChain,
    required pokemon,
  }) : super(pokemon: pokemon);
  @override
  List<Object> get props => [evolutionChain, pokemon];
}

class PokemonEvolutionDetailsNoEvolutions extends PokemonEvolutionDetailsSuccess {
  const PokemonEvolutionDetailsNoEvolutions({required pokemon, required evolutionChain})
      : super(evolutionChain: evolutionChain, pokemon: pokemon);

  @override
  List<Object> get props => [pokemon, evolutionChain];
}
