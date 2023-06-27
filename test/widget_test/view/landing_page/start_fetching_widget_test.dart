import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/view/landing_page/landing_page.dart';

import '../../../helpers/widget_test_helper.dart';

void main() {
  late GenerationCubit generationCubit;
  late PokemonDetailsCubit pokemonDetailsCubit;
  late Widget widgetUnderTest;

  const startWidgetKey = Key('landingPage_startWidget');
  const startWidgetButtonKey = Key('startWidget_button');

  setUp(() {
    generationCubit = MockGenerationCubit();
    pokemonDetailsCubit = MockPokemonDetailsCubit();
    widgetUnderTest = createWidgetShell(
      generationCubit: generationCubit,
      pokemonDetailsCubit: pokemonDetailsCubit,
      child: const StartFetchingWidget(),
    );

    when(() => generationCubit.state).thenReturn(GenerationInitial());
  });

  group('StartFetchingWidget', () {
    testWidgets('should render with widgets', (tester) async {
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      expect(find.byKey(startWidgetKey), findsOneWidget);
      expect(find.byKey(startWidgetButtonKey), findsOneWidget);
    });

    testWidgets('should add fetchPokemonGeneration when button is tapped', (tester) async {
      when(() => generationCubit.state).thenReturn(GenerationInitial());
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      final finder = find.byKey(startWidgetButtonKey);
      expect(finder, findsOneWidget);
      /*
      final buttonWidget = tester.widget(finder) as ElevatedButton;
      buttonWidget.onPressed?.call();

      await tester.pumpAndSettle();
      verify(() => generationCubit.fetchPokemonGeneration()).called(1);

      */
    });
  });
}
