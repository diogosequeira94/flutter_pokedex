import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/view/pokemon_details_page.dart';

class PokemonListWidget extends StatelessWidget {
  final List<PokemonBasicItem> pokemonList;
  const PokemonListWidget({Key? key, required this.pokemonList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
      child: ListView.builder(
        key: const Key('landingPage_pokemonList'),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokeItem = pokemonList[index];
          return ListTile(
            leading: Image.asset(
              key: const Key('pokeListItem_sprite'),
              Constants.getPokemonSprite(pokeItem.number.normalizeIndex()),
              fit: BoxFit.cover,
              width: 50.0,
              height: 50.0,
            ),
            title: Text(pokeItem.name),
            subtitle: Text(
              '#${pokeItem.number.normalizeIndex()}',
              key: const Key('pokeListItem_number'),
            ),
            onTap: () {
              context.read<PokemonDetailsCubit>().fetchPokemonDetailsByName(pokeItem.name);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: context.read<PokemonDetailsCubit>(),
                      ),
                      BlocProvider.value(
                        value: context.read<GenerationCubit>(),
                      )
                    ],
                    child: const PokemonDetailsPage(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
