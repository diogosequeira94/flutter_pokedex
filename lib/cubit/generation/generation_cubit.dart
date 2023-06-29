import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokemon/pokemon.dart';

part 'generation_state.dart';

class GenerationCubit extends Cubit<GenerationState> {
  GenerationCubit({required PokemonRepository pokemonRepository})
      : _pokemonRepository = pokemonRepository,
        super(GenerationInitial());

  final PokemonRepository _pokemonRepository;

  @visibleForTesting
  final List<PokemonBasicItem> pokemonList = [];

  int indexCounter = 1;

  Future<void> fetchPokemonGeneration() async {
    emit(FetchFirstGenInProgress());
    try {
      final response = await _pokemonRepository.getFirstPokemonGen();
      var responseList = response.pokemonItems;

      for (var pokemonItem in responseList) {
        final pokemon = PokemonBasicItem(
          name: pokemonItem.name,
          number: indexCounter,
        );
        pokemonList.add(pokemon);
        indexCounter++;
      }
      indexCounter = 1;

      emit(FetchFirstGenSuccess(pokemonList: pokemonList));
    } on Object catch (e) {
      emit(FetchFirstGenFailure(errorMessage: e.toString()));
    }
  }

  void searchBoxChanged(String query) async {
    var tempList = pokemonList.where((pokemon) => pokemon.name.toLowerCase().contains(query.toLowerCase())).toList();
    emit(SearchBoxChangedSuccess(pokemonList: tempList));
  }

  String getPokemonNameById(String id) {
    var pokemon = pokemonList.singleWhere((pokemon) => pokemon.number.normalizeIndex() == id);
    return pokemon.name;
  }
}
