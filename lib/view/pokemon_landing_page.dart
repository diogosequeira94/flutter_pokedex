import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/view/landing_page/landing_page.dart';

class PokemonLandingPage extends StatelessWidget {
  const PokemonLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
                    child: GridView.builder(
                      key: const Key('landingPage_pokemonGrid'),
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        mainAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.pokemonList.length,
                      itemBuilder: (context, index) {
                        final pokeItem = state.pokemonList[index];
                        return PokemonCardItem(pokeItem: pokeItem);
                      },
                    ),
                  ),
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
