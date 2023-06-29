import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/pokemon_details/pokemon_details_cubit.dart';
import 'package:pokedex/view/details_page/details_page.dart';
import 'package:pokedex/view/details_page/tabs_section.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
        builder: (context, state) {
          if (state is PokemonDetailsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonDetailsSuccess) {
            final pokemon = state.pokemon;
            return ExpandableBottomSheet(
              background: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PokeSpriteInfo(
                      pokemonName: state.pokemon.name,
                      pokemonIndex: state.pokemon.id,
                    ),
                    TypePillsWidget(types: state.pokemon.types),
                    const SizedBox(height: 30.0),
                    PokeDescription(description: pokemon.description!), //StatsWidget(statsList: state.pokemon.stats),
                  ],
                ),
              ),
              persistentContentHeight: 310,
              expandableContent: Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: TabsSection(
                  pokemon: state.pokemon,
                ),
              ),
            );
          } else if (state is PokemonDetailsFailure) {
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
