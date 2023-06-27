import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';

class MockGenerationCubit extends MockCubit<GenerationState> implements GenerationCubit {}

class MockPokemonDetailsCubit extends MockCubit<PokemonDetailsState> implements PokemonDetailsCubit {}

Widget createWidgetShell({
  required GenerationCubit generationCubit,
  required PokemonDetailsCubit pokemonDetailsCubit,
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<GenerationCubit>(
        create: (context) => generationCubit,
      ),
      BlocProvider<PokemonDetailsCubit>(
        create: (context) => pokemonDetailsCubit,
      ),
    ],
    child: MaterialApp(
      home: Scaffold(
        body: child,
      ),
    ),
  );
}
