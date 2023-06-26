import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokemon/pokemon.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late PokemonRepository pokemonRepository;
  late GenerationCubit generationCubit;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    generationCubit = GenerationCubit(pokemonRepository: pokemonRepository);
  });

  group('Emit States', () {
    test('initial state should be [GenerationInitial]', () {
      expect(generationCubit.state, equals(GenerationInitial()));
    });
  });

  group('FetchPokemonGeneration', () {
    blocTest<GenerationCubit, GenerationState>(
      'should emit FetchFirstGenInProgress then FetchFirstGenSuccess',
      build: () => generationCubit,
      act: (cubit) async {
        const generationResponse = PokemonGenerationResponse(count: 151, pokemonItems: []);
        when(() => pokemonRepository.getFirstPokemonGen()).thenAnswer((_) => Future.value(generationResponse));
        await cubit.fetchPokemonGeneration();
      },
      expect: () => [
        FetchFirstGenInProgress(),
        const FetchFirstGenSuccess(pokemonList: []),
      ],
    );

    blocTest<GenerationCubit, GenerationState>(
      'should emit FetchFirstGenFailure when repository throws exception',
      build: () => generationCubit,
      act: (cubit) async {
        when(() => pokemonRepository.getFirstPokemonGen()).thenThrow((_) => Exception());
        await cubit.fetchPokemonGeneration();
      },
      expect: () => [
        FetchFirstGenInProgress(),
        isA<FetchFirstGenFailure>(),
      ],
    );
  });

  group('SearchBoxChanged', () {
    final mockPokemonList = [
      const PokemonBasicItem(name: 'Mew', number: 151),
      const PokemonBasicItem(name: 'Pikachu', number: 25),
      const PokemonBasicItem(name: 'Raichu', number: 26),
    ];
    blocTest<GenerationCubit, GenerationState>(
      'should emit SearchBoxChangedSuccess',
      build: () => generationCubit,
      act: (cubit) async {
        cubit.searchBoxChanged('');
      },
      expect: () => [
        const SearchBoxChangedSuccess(pokemonList: []),
      ],
    );

    blocTest<GenerationCubit, GenerationState>(
      'should find matching Pokemon and emit SearchBoxChangedSuccess',
      build: () => generationCubit,
      act: (cubit) async {
        cubit.pokemonList.addAll(mockPokemonList);
        cubit.searchBoxChanged('Me');
      },
      expect: () => [
        SearchBoxChangedSuccess(pokemonList: [mockPokemonList[0]]),
      ],
    );

    blocTest<GenerationCubit, GenerationState>(
      'should not find a match when query is not part of Pokemon list',
      build: () => generationCubit,
      act: (cubit) async {
        cubit.pokemonList.addAll(mockPokemonList);
        cubit.searchBoxChanged('Rattata');
      },
      expect: () => [
        const SearchBoxChangedSuccess(pokemonList: []),
      ],
    );
  });
}
