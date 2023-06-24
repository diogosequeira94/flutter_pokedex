import 'package:flutter/material.dart';
import 'package:pokemon/src/api/models/species/species.dart';

import 'api/api/pokemon_api_client.dart';
import 'api/models/models.dart';

class PokemonRepository {
  static PokemonApiClient _pokemonApiClient = PokemonApiClient();

  static final _instance = PokemonRepository._internal();

  static PokemonRepository get instance => _instance;

  factory PokemonRepository() => _instance;

  PokemonRepository._internal() {
    _pokemonApiClient = PokemonApiClient();
  }

  @visibleForTesting
  PokemonRepository.testing(
    PokemonApiClient pokemonApiClient,
  ) {
    _pokemonApiClient = pokemonApiClient;
  }

  Future<PokemonGenerationResponse> getFirstPokemonGen() async {
    return await _pokemonApiClient.getFirstPokemonGen();
  }

  Future<Pokemon> getPokemonByName({required String name}) async {
    return await _pokemonApiClient.getPokemonByName(name);
  }

  Future<SpeciesResponse> getSpeciesInformation({required String name}) async {
    return await _pokemonApiClient.getSpeciesInformation(name);
  }
}
