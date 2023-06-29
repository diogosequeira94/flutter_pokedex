import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/view/home_page/home_page.dart';

import '../../../helpers/widget_test_helper.dart';
import '../../../mocks/unit_test_mocks.dart';

void main() {
  late GenerationCubit generationCubit;
  late PokemonDetailsCubit pokemonDetailsCubit;
  late Widget widgetUnderTest;

  const cardSpriteKey = Key('pokeCard_sprite');
  const cardNameKey = Key('pokeCard_name');
  const cardNumberKey = Key('pokeCard_number');
  const cardItemKey = Key('landingPage_pokemonItemCard');

  setUp(() {
    generationCubit = MockGenerationCubit();
    pokemonDetailsCubit = MockPokemonDetailsCubit();

    widgetUnderTest = createWidgetShell(
      generationCubit: generationCubit,
      pokemonDetailsCubit: pokemonDetailsCubit,
      child: PokemonCardItem(pokeItem: mockPokemonList[0]),
    );

    when(() => generationCubit.state).thenReturn(GenerationInitial());
    when(() => pokemonDetailsCubit.state).thenReturn(PokemonDetailsInitial());
  });

  group('PokemonCardWidget', () {
    testWidgets('should render with widgets', (tester) async {
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      expect(find.byKey(cardSpriteKey), findsOneWidget);
      expect(find.byKey(cardNameKey), findsOneWidget);
      expect(find.byKey(cardNumberKey), findsOneWidget);
      expect(find.byKey(cardItemKey), findsOneWidget);
    });

    testWidgets('name widget should display correct name and number', (tester) async {
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      final nameFinder = find.byKey(cardNameKey);
      final textNameWidget = tester.widget(nameFinder) as Text;

      final numberFinder = find.byKey(cardNumberKey);
      final textNumberWidget = tester.widget(numberFinder) as Text;

      expect(textNameWidget.data, 'Mew');
      expect(textNumberWidget.data, '#151');
    });

    /// ToDo: Check on debug
    /*
    testWidgets('should navigate to details screen on tap', (tester) async {
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      final itemFinder = find.byKey(cardItemKey);
      final gestureDetectorWidget =
          tester.widget(itemFinder) as GestureDetector;
      gestureDetectorWidget.onTap?.call();
      await tester.pump();

      expect(find.byType(PokemonDetailsPage), findsOneWidget);
    });
    */
  });
}
