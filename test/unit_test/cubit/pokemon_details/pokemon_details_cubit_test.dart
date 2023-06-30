import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokemon/pokemon.dart';

import '../../../mocks/unit_test_mocks.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late PokemonRepository pokemonRepository;
  late PokemonDetailsCubit pokemonDetailsCubit;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    pokemonDetailsCubit = PokemonDetailsCubit(pokemonRepository);
  });

  group('Emit States', () {
    test('initial state should be [PokemonInitial]', () {
      expect(pokemonDetailsCubit.state, equals(PokemonDetailsInitial()));
    });
  });

  group('FetchPokemonGeneration', () {
    blocTest<PokemonDetailsCubit, PokemonDetailsState>(
      'should emit PokemonInformationInProgress then PokemonInformationSuccess',
      build: () => pokemonDetailsCubit,
      act: (cubit) async {
        when(() => pokemonRepository.getPokemonByName(name: 'Pickachu')).thenAnswer((_) => Future.value(mockPokemon));
        when(() => pokemonRepository.getSpeciesInformation(name: 'Pickachu'))
            .thenAnswer((_) => Future.value(mockSpeciesResponse));
        when(() => pokemonRepository.getEvolutions()).thenAnswer((_) => Future.value(mockEvolutionList));

        await cubit.fetchPokemonDetailsByName('Pickachu');
      },
      expect: () => [
        PokemonDetailsInProgress(),
        PokemonDetailsSuccess(
          pokemon: mockPokemon.copyWith(
            description: mockSpeciesResponse.flavorTextEntries[0].flavorText,
            habitat: mockSpeciesResponse.habitat.name,
            evolutions: mockEvolutionList[0],
          ),
        ),
      ],
    );

    blocTest<PokemonDetailsCubit, PokemonDetailsState>(
      'should emit PokemonInformationFailure when repository throws exception',
      build: () => pokemonDetailsCubit,
      act: (cubit) async {
        when(() => pokemonRepository.getPokemonByName(name: 'Pickachu')).thenThrow((_) => Exception());
        await cubit.fetchPokemonDetailsByName('Pickachu');
      },
      expect: () => [
        PokemonDetailsInProgress(),
        isA<PokemonDetailsFailure>(),
      ],
    );
  });
}
