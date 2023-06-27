import 'package:flutter/material.dart';
import 'api/api/pokemon_api_client.dart';
import 'api/models/models.dart';

abstract class IPokemonRepository {
  Future<PokemonGenerationResponse> getFirstPokemonGen();
  Future<Pokemon> getPokemonByName({required String name});
  Future<SpeciesResponse> getSpeciesInformation({required String name});
}

class PokemonRepository extends IPokemonRepository {
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

  @override
  Future<PokemonGenerationResponse> getFirstPokemonGen() async {
    return await _pokemonApiClient.getFirstPokemonGen();
  }

  @override
  Future<Pokemon> getPokemonByName({required String name}) async {
    return await _pokemonApiClient.getPokemonByName(name);
  }

  @override
  Future<SpeciesResponse> getSpeciesInformation({required String name}) async {
    return await _pokemonApiClient.getSpeciesInformation(name);
  }
}
