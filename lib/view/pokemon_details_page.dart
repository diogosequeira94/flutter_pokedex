import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon_details/pokemon_cubit.dart';
import 'package:pokedex/view/details_page/details_page.dart';
import 'package:pokedex/view/details_page/tabs_section.dart';

class PokemonDetailsPage extends StatelessWidget {
  final String pokemonName;
  final int pokemonIndex;
  const PokemonDetailsPage({
    Key? key,
    required this.pokemonName,
    required this.pokemonIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(pokemonName),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonInformationInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonInformationSuccess) {
            final pokemon = state.pokemon;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PokeSpriteInfo(
                    pokemonName: pokemonName,
                    pokemonIndex: pokemonIndex,
                  ),
                  TypePillsWidget(types: state.pokemon.types),
                  const SizedBox(height: 20.0),
                  HeightWeightWidget(
                      height: pokemon.height, weight: pokemon.weight),
                  const SizedBox(height: 30.0),
                  PokeDescription(description: pokemon.description!),
                  const SizedBox(height: 30.0),
                 AbilitiesSection(abilities: state.pokemon.abilities),
                  // const SizedBox(height: 40.0),
                  // const Text(
                  //   'Moves',
                  //   style: TextStyle(fontSize: 24.0),
                  // ),
                  // const SizedBox(height: 15.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     for (final moves in state.pokemon.moves)
                  //       Text(moves.move?.name?.capitalize() ?? 'Unknown'),
                  //   ],
                  // ),
                  const SizedBox(height: 40.0),
                  TabsSection(statsList: state.pokemon.stats),
                  //StatsWidget(statsList: state.pokemon.stats),
                ],
              ),
            );
          } else if (state is PokemonInformationFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
