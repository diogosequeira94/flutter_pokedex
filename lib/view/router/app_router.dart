import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/view/screens/screens.dart';
import 'package:pokemon/pokemon.dart';

final GenerationCubit _generationCubit = GenerationCubit(
  pokemonRepository: PokemonRepository.instance,
)..fetchPokemonGeneration();

final PokemonDetailsCubit _detailsCubit = PokemonDetailsCubit(
  PokemonRepository.instance,
);

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  const PokedexPageCase());
      case '/home':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider<GenerationCubit>.value(
              value: _generationCubit,
            ),
            BlocProvider<PokemonDetailsCubit>.value(
              value: _detailsCubit,
            ),
          ], child: const PokemonHomePage()),
        );
      case '/details':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider<GenerationCubit>.value(
              value: _generationCubit,
            ),
            BlocProvider<PokemonDetailsCubit>.value(
              value: _detailsCubit,
            ),
          ], child: const PokemonDetailsPage()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<GenerationCubit>.value(
                value: _generationCubit,
              ),
              BlocProvider<PokemonDetailsCubit>.value(
                value: _detailsCubit,
              ),
            ],
            child: const PokemonHomePage(),
          ),
        );
    }
  }

  void dispose() {
    _generationCubit.close();
    _detailsCubit.close();
  }
}
