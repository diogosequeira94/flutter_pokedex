import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokedex/cubit/pokemon_details/pokemon_details_cubit.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/view/pokemon_details_page.dart';

class PokemonCardItem extends StatelessWidget {
  final PokemonBasicItem pokeItem;
  const PokemonCardItem({Key? key, required this.pokeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PokemonDetailsCubit>().fetchPokemonByName(pokeItem.name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<PokemonDetailsCubit>(),
              child: PokemonDetailsPage(pokemonName: pokeItem.name, pokemonIndex: pokeItem.number),
            ),
          ),
        );
      },
      child: Card(
        key: const Key('landingPage_pokemonItemCard'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/gen1/${pokeItem.name}.jpeg',
              fit: BoxFit.cover,
              width: 80.0,
              height: 80,
            ),
            const SizedBox(height: 4.0),
            Text(pokeItem.name.capitalize()),
            Text('#${pokeItem.number}'),
          ],
        ),
      ),
    );
  }
}
