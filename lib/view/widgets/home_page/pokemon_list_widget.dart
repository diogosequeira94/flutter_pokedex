import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokedex/utils/utils.dart';

class PokemonListWidget extends StatelessWidget {
  final List<PokemonBasicItem> pokemonList;
  const PokemonListWidget({Key? key, required this.pokemonList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: ListView.builder(
        key: const Key('landingPage_pokemonList'),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokeItem = pokemonList[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 8.0),
              leading: Image.asset(
                key: const Key('pokeListItem_sprite'),
                Constants.getPokemonSprite(pokeItem.number.normalizeIndex()),
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
              ),
              title: Text(
                pokeItem.name.capitalize(),
                style: const TextStyle(fontSize: 16.5),
              ),
              subtitle: Text(
                '#${pokeItem.number.normalizeIndex()}',
                key: const Key('pokeListItem_number'),
              ),
              onTap: () {
                context.read<PokemonDetailsCubit>().fetchPokemonDetailsByName(pokeItem.name);
                Navigator.of(context).pushNamed('/details');
              },
            ),
          );
        },
      ),
    );
  }
}
