import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/view/widgets/home_page/poke_searchbox.dart';

import '../../../helpers/widget_test_helper.dart';
import '../../../mocks/unit_test_mocks.dart';

void main() {
  late GenerationCubit generationCubit;
  late PokemonDetailsCubit pokemonDetailsCubit;
  late Widget widgetUnderTest;

  const searchBoxTitleKey = Key('pokeSearchBox_title');
  const searchBoxTextFieldKey = Key('pokeSearchBox_textField');

  setUp(() {
    generationCubit = MockGenerationCubit();
    pokemonDetailsCubit = MockPokemonDetailsCubit();
    widgetUnderTest = createWidgetShell(
      generationCubit: generationCubit,
      pokemonDetailsCubit: pokemonDetailsCubit,
      child: const PokeSearchBox(),
    );

    when(() => generationCubit.state).thenReturn(FetchFirstGenSuccess(pokemonList: mockPokemonList));
  });

  group('PokeSearchBox', () {
    testWidgets('should render with widgets', (tester) async {
      when(() => generationCubit.state).thenReturn(GenerationInitial());
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      expect(find.byKey(searchBoxTitleKey), findsOneWidget);
      expect(find.byKey(searchBoxTextFieldKey), findsOneWidget);
    });

    testWidgets('textField renders without input and correct hint', (tester) async {
      when(() => generationCubit.state).thenReturn(GenerationInitial());
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      expect(find.byKey(searchBoxTextFieldKey), findsOneWidget);
      final finder = tester.widget(find.byKey(searchBoxTextFieldKey)) as TextField;
      expect(finder.controller?.text, '');
      expect(finder.decoration?.hintText, 'Pokémon name');
    });

    testWidgets('interacting with textField calls searchBoxChanged method', (tester) async {
      when(() => generationCubit.state).thenReturn(GenerationInitial());
      await tester.pumpWidget(widgetUnderTest);
      await tester.pump();

      final finder = find.byKey(searchBoxTextFieldKey);
      expect(finder, findsOneWidget);
      final textFieldWidget = tester.widget(finder) as TextField;

      await tester.enterText(finder, 'P');
      textFieldWidget.controller?.text;
      await tester.pumpAndSettle();

      verify(() => generationCubit.searchBoxChanged('P')).called(1);
    });
  });
}
