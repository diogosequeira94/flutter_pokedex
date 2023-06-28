import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/src/api/models/evolution/evolution.dart';
import 'package:pokemon/src/api/models/generation/pokemon_generation_response.dart';
import 'package:pokemon/src/api/models/pokemon/pokemon.dart';
import 'package:pokemon/src/api/models/species/species_response.dart';
import 'pokemon_endpoints.dart';

class PokemonApiClient {
  Future<PokemonGenerationResponse> getFirstPokemonGen() async {
    try {
      final response = await http.get(Uri.parse(PokemonEndpoints.getFirstPokemonGen()));
      return PokemonGenerationResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } on Object catch (error) {
      throw Exception('Error trying to fetch Pokémons: $error');
    }
  }

  Future<Pokemon> getPokemonByName(String name) async {
    try {
      final response = await http.get(Uri.parse(PokemonEndpoints.getPokemonByName(name)));
      return Pokemon.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } on Object catch (error) {
      throw Exception('Error trying to Get Pokémon by name: $error');
    }
  }

  Future<SpeciesResponse> getSpeciesInformation(String name) async {
    try {
      final response = await http.get(Uri.parse(PokemonEndpoints.getSpeciesInformation(name)));
      return SpeciesResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } on Object catch (error) {
      throw Exception('Error trying to get Pokémon Species information: $error');
    }
  }

  Future<List<Evolution>> getEvolutions() async {
    try {
      final response = await http.get(Uri.parse(PokemonEndpoints.getEvolutions()));
      return (response as List).map((evolution) => Evolution.fromJson(evolution)).toList();
    } on Object catch (error) {
      throw Exception('Error trying to get Pokémon evolutions: $error');
    }
  }
}
