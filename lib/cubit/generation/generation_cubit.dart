import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/pokemon.dart';

part 'generation_state.dart';

class GenerationCubit extends Cubit<GenerationState> {
  final PokemonApiClient pokemonApiClient;
  GenerationCubit({required this.pokemonApiClient}) : super(GenerationInitial());

  Future<void> fetchPokemonGeneration() async {
    emit(FetchFirstGenInProgress());
    try {
      final response = await pokemonApiClient.getFirstPokemonGen();
      emit(FetchFirstGenSuccess(pokemonList: response.pokemonItems));
    } on Object catch (e) {
      emit(FetchFirstGenFailure(errorMessage: e.toString()));
    }
  }
}
