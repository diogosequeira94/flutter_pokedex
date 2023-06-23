import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/utils/extensions.dart';
import 'package:pokemon/pokemon.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonApiClient pokemonApiClient;
  PokemonCubit(this.pokemonApiClient) : super(PokemonInitial());

  Future<void> fetchPokemonByName(String name) async {
    emit(PokemonInformationInProgress());
    print('GETTING POKE!');
    try {
      final pokemonBaseInfo = await pokemonApiClient.getPokemonByName(name);
      final movesLength = pokemonBaseInfo.moves.length >= 4
          ? pokemonBaseInfo.moves.sublist(0, 4)
          : pokemonBaseInfo.moves;

      final pokemonSpeciesInfo =
          await pokemonApiClient.getSpeciesInformation(name);

      final firstDescription = pokemonSpeciesInfo
          .flavorTextEntries[0].flavorText.format();

      final pokemon = pokemonBaseInfo.copyWith(
        description: firstDescription,
        moves: movesLength,
      );

      emit(PokemonInformationSuccess(pokemon: pokemon));
    } on Object catch (e) {
      print('EXCEPTION WAS ${e.toString}');
      emit(PokemonInformationFailure(errorMessage: e.toString()));
    }
  }
}
