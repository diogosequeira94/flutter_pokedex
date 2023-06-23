class PokemonEndpoints {
  static const _baseUrl = 'http://pokeapi.co';
  static String getFirstPokemonGen() => '$_baseUrl/api/v2/pokemon?limit=151&offset=0';
  static String getPokemonByName(String name) => '$_baseUrl/api/v2/pokemon/$name';
  static String getSpeciesInformation(String name) => '$_baseUrl/api/v2/pokemon-species/$name';
}
