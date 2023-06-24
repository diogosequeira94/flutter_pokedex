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
        title: const Text('Pokemon Details'),
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
                  const SizedBox(height: 30.0),
                  PokeDescription(description: pokemon.description!),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: TabsSection(
                      pokemon: state.pokemon,
                    ),
                  ),
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
