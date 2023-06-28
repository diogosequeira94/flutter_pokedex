import 'package:mocktail/mocktail.dart';
import 'package:pokemon/pokemon.dart';
import 'package:test/test.dart';

class MockPokemonApiClient extends Mock implements PokemonApiClient {}

void main() {
  late PokemonRepository pokemonRepository;
  late PokemonApiClient pokemonApiClient;

  setUp(() {
    pokemonApiClient = MockPokemonApiClient();
    pokemonRepository = PokemonRepository.testing(pokemonApiClient);
  });

  group('PokemonRepository', () {
    test('getFirstPokemonGen is called and returns PokemonGenerationResponse', () async {
      const pokemonGenerationResponse = PokemonGenerationResponse(count: 151, pokemonItems: []);
      when(() => pokemonApiClient.getFirstPokemonGen()).thenAnswer(
        (_) => Future.value(pokemonGenerationResponse),
      );
      final response = await pokemonRepository.getFirstPokemonGen();
      expect(response, pokemonGenerationResponse);
    });

    test('getPokemonByName is called and returns Pokemon', () async {
      const pokemon = Pokemon(
        name: 'bulbasaur',
        id: 1,
        height: 2,
        weight: 2,
        abilities: [],
        moves: [],
        types: [],
        stats: [],
      );

      when(() => pokemonApiClient.getPokemonByName('Pikachu')).thenAnswer(
        (_) => Future.value(pokemon),
      );

      final response = await pokemonRepository.getPokemonByName(name: 'Pikachu');

      expect(response, pokemon);
    });

    test('getSpeciesInformation is called and returns SpeciesResponse', () async {
      const speciesResponse = SpeciesResponse(
        eggGroups: [],
        flavorTextEntries: [],
        habitat: Habitat(name: 'Mountain'),
        isBaby: false,
        isLegendary: false,
        isMythical: false,
      );
      when(() => pokemonApiClient.getSpeciesInformation('Charmander')).thenAnswer(
        (_) => Future.value(speciesResponse),
      );

      final response = await pokemonRepository.getSpeciesInformation(name: 'Charmander');

      expect(response, speciesResponse);
    });
  });
}
