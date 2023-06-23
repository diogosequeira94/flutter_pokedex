part of 'generation_cubit.dart';

abstract class GenerationState extends Equatable {
  const GenerationState();
}

class GenerationInitial extends GenerationState {
  @override
  List<Object> get props => [];
}

class FetchFirstGenInProgress extends GenerationState {
  @override
  List<Object> get props => [];
}

class FetchFirstGenSuccess extends GenerationState {
  final List<PokemonGenerationItem> pokemonList;
  const FetchFirstGenSuccess({required this.pokemonList});
  @override
  List<Object> get props => [pokemonList];
}

class FetchFirstGenFailure extends GenerationState {
  final String errorMessage;
  const FetchFirstGenFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
