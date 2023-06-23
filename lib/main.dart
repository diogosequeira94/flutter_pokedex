import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonApiClient = PokemonApiClient();
    return MaterialApp(
      title: 'Pokedex Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<GenerationCubit>(
          create: (context) => GenerationCubit(
            pokemonApiClient: pokemonApiClient,
          ),
        ),
        BlocProvider<PokemonCubit>(
          create: (context) => PokemonCubit(
            pokemonApiClient,
          ),
        ),
      ], child: const PokemonLandingPage()),
    );
  }
}
