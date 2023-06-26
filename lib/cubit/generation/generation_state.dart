part of 'generation_cubit.dart';

abstract class GenerationState extends Equatable {
  const GenerationState();
}

class GenerationInitial extends GenerationState {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class FetchFirstGenInProgress extends GenerationState {
  @override
  List<Object> get props => [];
}

class FetchFirstGenSuccess extends GenerationState {
  final List<PokemonBasicItem> pokemonList;
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

class SearchBoxChangedSuccess extends FetchFirstGenSuccess {
  const SearchBoxChangedSuccess({required List<PokemonBasicItem> pokemonList})
      : super(pokemonList: pokemonList);
  @override
  List<Object> get props => [pokemonList];
}
