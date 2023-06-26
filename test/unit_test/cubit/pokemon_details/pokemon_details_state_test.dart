import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/cubit/cubit.dart';

import '../../../mocks/unit_test_mocks.dart';

void main() {
  group('PokemonDetailsCubit', () {
    group('PokemonInformationInProgress', () {
      test('props', () {
        expect(
          PokemonInformationInProgress().props,
          [],
        );
      });

      test('equatable', () {
        final state1 = PokemonInformationInProgress();
        final state2 = PokemonInformationInProgress();

        expect(
          state1,
          state2,
        );
      });
    });

    group('PokemonInformationSuccess', () {
      test('props', () {
        expect(
          const PokemonInformationSuccess(pokemon: mockPokemon).props,
          [mockPokemon],
        );
      });
    });

    group('PokemonInformationFailure', () {
      test('props', () {
        expect(
          const FetchFirstGenFailure(errorMessage: 'error').props,
          ['error'],
        );
      });
    });
  });
}
