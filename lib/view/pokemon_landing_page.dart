import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/generation/generation_cubit.dart';
import 'package:pokedex/cubit/pokemon_details/pokemon_details_cubit.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/view/pokemon_details_page.dart';

class PokemonLandingPage extends StatelessWidget {
  const PokemonLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GenerationCubit, GenerationState>(
        builder: (context, state) {
          if (state is FetchFirstGenInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchFirstGenSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Image.asset(Constants.pokedexAssetPath),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    child: GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.pokemonList.length,
                      itemBuilder: (context, index) {
                        final pokeItem = state.pokemonList[index];
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<PokemonDetailsCubit>()
                                .fetchPokemonByName(pokeItem.name);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<PokemonDetailsCubit>(),
                                  child: PokemonDetailsPage(
                                      pokemonName: pokeItem.name.capitalize(),
                                      pokemonIndex: index + 1),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/gen1/${index + 1}.jpeg',
                                  fit: BoxFit.cover,
                                  width: 80.0,
                                  height: 80,
                                ),
                                const SizedBox(height: 4.0),
                                Text(pokeItem.name.capitalize()),
                                Text('#${index + 1}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: Image.asset('assets/pokedex.png'),
                ),
                ElevatedButton(
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Lets start!'),
                  ),
                  onPressed: () {
                    context.read<GenerationCubit>().fetchPokemonGeneration();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
