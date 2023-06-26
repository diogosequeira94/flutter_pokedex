import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/cubit/cubit.dart';

void main() {
  group('GenerationCubit', () {
    group('FetchFirstGenInProgress', () {
      test('props', () {
        expect(
          FetchFirstGenInProgress().props,
          [],
        );
      });

      test('equatable', () {
        final state1 = FetchFirstGenInProgress();
        final state2 = FetchFirstGenInProgress();

        expect(
          state1,
          state2,
        );
      });
    });

    group('FetchFirstGenSuccess', () {
      test('props', () {
        expect(
          const FetchFirstGenSuccess(pokemonList: []).props,
          [[]],
        );
      });
    });

    group('FetchFirstGenFailure', () {
      test('props', () {
        expect(
          const FetchFirstGenFailure(errorMessage: 'error').props,
          ['error'],
        );
      });
    });

    group('SearchBoxChangedSuccess', () {
      test('props', () {
        expect(
          const SearchBoxChangedSuccess(pokemonList: []).props,
          [[]],
        );
      });
    });
  });
}
