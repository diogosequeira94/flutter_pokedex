import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/utils/utils.dart';

class EvolutionsChart extends StatelessWidget {
  const EvolutionsChart({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        if (state is PokemonDetailsSuccess) {
          final evolution = state.pokemon.evolution?.evolutions;
          return evolution == null
              ? const Center(
                  child: Text(
                    'This Pokémon does not evolve.',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _EvolutionRow(
                          currentForm: evolution[0],
                          evolvedForm: evolution[1],
                        ),
                        if (evolution.length > 2)
                          _EvolutionRow(
                            currentForm: evolution[1],
                            evolvedForm: evolution[2],
                          ),
                      ],
                    ),
                  ),
                );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _EvolutionRow extends StatelessWidget {
  final String currentForm, evolvedForm;
  const _EvolutionRow({
    Key? key,
    required this.currentForm,
    required this.evolvedForm,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: getAsset(currentForm),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            children: [
              SizedBox(
                width: 65,
                height: 65,
                child: Image.asset('assets/arrow.png'),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: getAsset(evolvedForm),
        ),
      ],
    );
  }

/*
  void _navigateToPokemonDetailsPage(BuildContext context, String name, int id){
    context.read<PokemonDetailsCubit>().fetchPokemonDetailsByName(name);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<PokemonDetailsCubit>(),
          child: PokemonDetailsPage(pokemonName: name, pokemonIndex: id),
        ),
      ),
    );
  }

 */

  Widget getAsset(String id) {
    return Image.asset(
      Constants.getPokemonSprite(evolvedForm),
      fit: BoxFit.cover,
      width: 125.0,
      height: 125.0,
    );
  }
}
