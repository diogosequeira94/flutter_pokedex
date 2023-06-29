import 'package:flutter/material.dart';
import 'package:pokedex/utils/extensions.dart';

class PokeSpriteInfo extends StatelessWidget {
  final String pokemonName;
  final int pokemonIndex;
  const PokeSpriteInfo({Key? key, required this.pokemonName, required this.pokemonIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/gen1/${pokemonIndex.normalizeIndex()}.jpeg',
          fit: BoxFit.cover,
          width: 200.0,
          height: 200.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            pokemonName.capitalize(),
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
      ],
    );
  }
}
