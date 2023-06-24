import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/utils/extensions.dart';
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

      final pokemonSpeciesInfo =
          await pokemonApiClient.getSpeciesInformation(name);

      final firstDescription = pokemonSpeciesInfo
          .flavorTextEntries[0].flavorText.formatTrivia();

      final pokemon = pokemonBaseInfo.copyWith(
        description: firstDescription,
        habitat: pokemonSpeciesInfo.habitat.name,
      );

      emit(PokemonInformationSuccess(pokemon: pokemon));
    } on Object catch (e) {
      print('EXCEPTION WAS ${e.toString}');
      emit(PokemonInformationFailure(errorMessage: e.toString()));
    }
  }
}
