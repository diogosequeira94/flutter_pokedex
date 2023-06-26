import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/view/pokemon_landing_page.dart';

import '../../mocks/unit_test_mocks.dart';

class MockGenerationCubit extends MockCubit<GenerationState> implements GenerationCubit {}

class MockPokemonDetailsCubit extends MockCubit<PokemonDetailsState> implements PokemonDetailsCubit {}

void main() {
  late GenerationCubit generationCubit;
  late PokemonDetailsCubit pokemonDetailsCubit;
  late Widget widgetUnderTest;

  const pokemonItemCardKey = Key('landingPage_pokemonItemCard');
  const pokedexAssetKey = Key('landingPage_pokedexAsset');
  const pokeSearchKey = Key('landingPage_pokeSearchBox');
  const pokemonGridKey = Key('landingPage_pokemonGrid');
  const startWidgetKey = Key('landingPage_startWidget');

  setUp(() {
    generationCubit = MockGenerationCubit();
    pokemonDetailsCubit = MockPokemonDetailsCubit();
    widgetUnderTest = MultiBlocProvider(
      providers: [
        BlocProvider<GenerationCubit>(
          create: (context) => generationCubit,
        ),
        BlocProvider<PokemonDetailsCubit>(
          create: (context) => pokemonDetailsCubit,
        ),
      ],
      child: const MaterialApp(home: PokemonLandingPage()),
    );
  });

  group('PokemonLandingPage', () {
    testWidgets('should render when state is [GenerationInitial]', (tester) async {
      when(() => generationCubit.state).thenReturn(GenerationInitial());
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      expect(find.byKey(startWidgetKey), findsOneWidget);
    });

    testWidgets('should render banner, searchBox and grid with items when state is [FetchFirstGenSuccess]',
        (tester) async {
      when(() => generationCubit.state).thenReturn(FetchFirstGenSuccess(pokemonList: mockPokemonList));
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      expect(find.byKey(pokedexAssetKey), findsOneWidget);
      expect(find.byKey(pokeSearchKey), findsOneWidget);
      expect(find.byKey(pokemonGridKey), findsOneWidget);
      expect(find.byKey(pokemonItemCardKey), findsNWidgets(6));
    });

    testWidgets('should render circular progress bar when state is [FetchFirstGenInProgress]', (tester) async {
      when(() => generationCubit.state).thenReturn(FetchFirstGenInProgress());
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should render widget with text error message when state is [FetchFirstGenFailure]', (tester) async {
      const mockErrorMessage = 'Generic API error';
      when(() => generationCubit.state).thenReturn(const FetchFirstGenFailure(errorMessage: mockErrorMessage));
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();
      const textWidgetKey = Key('landingPage_errorMessage');
      expect(find.byKey(textWidgetKey), findsOneWidget);

      final widgetFinder = tester.widget(find.byKey(textWidgetKey)) as Text;
      expect(widgetFinder.data, mockErrorMessage);
    });
  });
}
