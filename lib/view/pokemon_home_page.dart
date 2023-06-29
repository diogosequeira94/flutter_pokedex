import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/view/home_page/home_page.dart';

class PokemonLandingPage extends StatelessWidget {
  const PokemonLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<GenerationCubit, GenerationState>(
        builder: (context, state) {
          if (state is FetchFirstGenSuccess) {
            return FloatingActionButton(
                child: Icon(state.pokemonViewMode == PokemonViewMode.listView ? Icons.grid_view : Icons.list_rounded),
                onPressed: () {
                  context.read<GenerationCubit>().toggleViewMode();
                });
          }
          return const SizedBox.shrink();
        },
      ),
      body: BlocBuilder<GenerationCubit, GenerationState>(
        builder: (context, state) {
          if (state is FetchFirstGenFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                key: const Key('landingPage_errorMessage'),
              ),
            );
          }
          if (state is FetchFirstGenInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchFirstGenSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    key: const Key('landingPage_pokedexAsset'),
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Image.asset(Constants.pokedexAssetPath),
                  ),
                  const PokeSearchBox(
                    key: Key('landingPage_pokeSearchBox'),
                  ),
                  state.pokemonViewMode == PokemonViewMode.gridView
                      ? PokemonGridWidget(pokemonList: state.pokemonList)
                      : PokemonListWidget(pokemonList: state.pokemonList),
                ],
              ),
            );
          }
          return const StartFetchingWidget();
        },
      ),
    );
  }
}
