import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokemon/pokemon.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final PokemonRepository pokemonRepository;
  PokemonDetailsCubit(this.pokemonRepository) : super(PokemonDetailsInitial());

  Future<void> fetchPokemonByName(String name) async {
    emit(PokemonDetailsInProgress());
    try {
      final pokemonBaseInfo = await pokemonRepository.getPokemonByName(name: name);

      final pokemonSpeciesInfo = await pokemonRepository.getSpeciesInformation(name: name);

      final firstDescription = pokemonSpeciesInfo.flavorTextEntries[0].flavorText.formatTrivia();

      final pokemon = pokemonBaseInfo.copyWith(
        description: firstDescription,
        habitat: pokemonSpeciesInfo.habitat.name.capitalize(),
      );

      emit(PokemonDetailsSuccess(pokemon: pokemon));
    } on Object catch (e) {
      emit(PokemonDetailsFailure(errorMessage: e.toString()));
    }
  }
}
