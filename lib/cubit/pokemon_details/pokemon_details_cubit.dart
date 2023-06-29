import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokemon/pokemon.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final PokemonRepository pokemonRepository;
  PokemonDetailsCubit(this.pokemonRepository) : super(PokemonDetailsInitial());

  /// Fetches [Pokemon] details data from different endpoints
  /// in an optimal scenario response should come from a unique ep
  ///
  Future<void> fetchPokemonDetailsByName(String name) async {
    emit(PokemonDetailsInProgress());
    try {
      final pokemonBaseInfo = await pokemonRepository.getPokemonByName(name: name);
      final pokemonSpeciesInfo = await pokemonRepository.getSpeciesInformation(name: name);
      final pokemonEvolutions = await _fetchEvolutions(name);

      final firstDescription = pokemonSpeciesInfo.flavorTextEntries[0].flavorText.formatTrivia();

      final pokemon = pokemonBaseInfo.copyWith(
        description: firstDescription,
        habitat: pokemonSpeciesInfo.habitat.name.capitalize(),
        evolutions: pokemonEvolutions,
      );

      emit(PokemonDetailsSuccess(pokemon: pokemon));
    } on Object catch (e) {
      emit(PokemonDetailsFailure(errorMessage: e.toString()));
    }
  }

  Future<Evolution?> _fetchEvolutions(String name) async {
    try {
      final evolutionInfo = await pokemonRepository.getEvolutions();
      final evolutionChain = evolutionInfo.singleWhere((evolution) => evolution.name!.toLowerCase() == name);
      return _hasSingleEvolution(evolutionChain) ? null : evolutionChain;
    } on Object catch (e) {
      emit(PokemonDetailsFailure(errorMessage: e.toString()));
    }
    return null;
  }

  bool _hasSingleEvolution(Evolution evolutionChain) {
    return evolutionChain.id == evolutionChain.evolutions![0] && evolutionChain.evolutions!.length < 2;
  }
}
