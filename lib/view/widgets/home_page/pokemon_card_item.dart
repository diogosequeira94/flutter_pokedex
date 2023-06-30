import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/cubit.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokedex/utils/utils.dart';

class PokemonCardItem extends StatelessWidget {
  final PokemonBasicItem pokeItem;
  const PokemonCardItem({Key? key, required this.pokeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('landingPage_pokemonItemCard'),
      onTap: () {
        context.read<PokemonDetailsCubit>().fetchPokemonDetailsByName(pokeItem.name);
        Navigator.of(context).pushNamed('/details');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              key: const Key('pokeCard_sprite'),
              Constants.getPokemonSprite(pokeItem.number.normalizeIndex()),
              fit: BoxFit.cover,
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(height: 4.0),
            Text(
              pokeItem.name.capitalize(),
              key: const Key('pokeCard_name'),
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              '#${pokeItem.number.normalizeIndex()}',
              key: const Key('pokeCard_number'),
            ),
          ],
        ),
      ),
    );
  }
}
