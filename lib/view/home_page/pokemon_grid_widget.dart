import 'package:flutter/material.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokedex/view/home_page/pokemon_card_item.dart';

class PokemonGridWidget extends StatelessWidget {
  final List<PokemonBasicItem> pokemonList;
  const PokemonGridWidget({Key? key, required this.pokemonList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokeItem = pokemonList[index];
          return PokemonCardItem(pokeItem: pokeItem);
        },
      ),
    );
  }
}
