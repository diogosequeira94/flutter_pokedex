class PokemonEndpoints {
  /// PokeApi endpoints
  static const _baseUrl = 'http://pokeapi.co';
  static String getFirstPokemonGen() => '$_baseUrl/api/v2/pokemon?limit=151&offset=0';
  static String getPokemonByName(String name) => '$_baseUrl/api/v2/pokemon/$name';
  static String getSpeciesInformation(String name) => '$_baseUrl/api/v2/pokemon-species/$name';
  static String getEvolutionChain(int id) => '$_baseUrl/api/v2/evolution-chain/$id';

  /// GitHub endpoints
  static String getEvolutions() =>
      'https://gist.github.com/diogosequeira94/55eef831ef1918ae8126af163e75d13c/raw/evolutions.json';
  static String getPokemonSprite(String id) => "https://assets.pokemon.com/assets/cms2/img/pokedex/full/$id.png";
}
