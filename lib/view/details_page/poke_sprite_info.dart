import 'package:flutter/material.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/utils.dart';

class PokeSpriteInfo extends StatelessWidget {
  final String pokemonName;
  final int pokemonIndex;
  const PokeSpriteInfo({Key? key, required this.pokemonName, required this.pokemonIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 30.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              '#${pokemonIndex.normalizeIndex()}',
              style: const TextStyle(fontSize: 22.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Image.asset(
            Constants.getPokemonSprite(pokemonIndex.normalizeIndex()),
            fit: BoxFit.cover,
            width: 215.0,
            height: 215.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Text(
            pokemonName.capitalize(),
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
      ],
    );
  }
}
