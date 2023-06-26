import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/src/api/models/generation/pokemon_generation_response.dart';
import 'package:pokemon/src/api/models/pokemon/pokemon.dart';
import 'package:pokemon/src/api/models/species/species_response.dart';
import 'pokemon_endpoints.dart';

class PokemonApiClient {
  Future<PokemonGenerationResponse> getFirstPokemonGen() async {
    try {
      final response = await http.get(Uri.parse(PokemonEndpoints.getFirstPokemonGen()));
      return PokemonGenerationResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } on Object catch (e) {
      print('Exception: $e');
      throw Exception();
    }
  }

  Future<Pokemon> getPokemonByName(String name) async {
    try {
      final response = await http.get(Uri.parse(PokemonEndpoints.getPokemonByName(name)));
      return Pokemon.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } on Object catch (e) {
      print('Exception: $e');
      throw Exception();
    }
  }

  Future<SpeciesResponse> getSpeciesInformation(String name) async {
    try {
      final response = await http.get(Uri.parse(PokemonEndpoints.getSpeciesInformation(name)));
      return SpeciesResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } on Object catch (e) {
      print('Exception: $e');
      throw Exception();
    }
  }
}
