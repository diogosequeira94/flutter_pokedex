import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';

class EvolutionsChart extends StatelessWidget {
  const EvolutionsChart({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsSuccess) {
          print(state.pokemon.evolutions);
          return const Center(
            child: Text('It has Evolutions!'),
          );
        }
        return const Center(
          child: Text('I dont know'),
        );
      },
    );
  }
}
