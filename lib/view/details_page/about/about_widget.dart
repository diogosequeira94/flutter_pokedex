import 'package:flutter/material.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/view/details_page/about/weaknesses_widget.dart';
import 'package:pokemon/pokemon.dart';

class AboutWidget extends StatelessWidget {
  final Pokemon pokemon;
  final List<Abilities> abilities;
  const AboutWidget({Key? key, required this.abilities, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Height',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const SizedBox(width: 20.0),
              Text(
                '${(pokemon.height! / 10).toString()} m',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              const Text(
                'Weight',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const SizedBox(width: 20.0),
              Text(
                '${(pokemon.weight! * 0.1).roundToDouble().toString()} kg',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              const Text(
                'Habitat',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const SizedBox(width: 20.0),
              Text(
                pokemon.habitat ?? 'N/A',
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              const Text(
                'Abilities',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const SizedBox(width: 15.0),
              Row(
                children: [
                  for (final ability in pokemon.abilities)
                    Card(
                      margin: const EdgeInsets.all(4.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(ability.ability!.name!.formatMove().capitalize()),
                      ),
                    ),
                ],
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Weaknesses',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              const SizedBox(width: 15.0),
              Flexible(child: WeaknessesWidget(types: pokemon.types)),
            ],
          ),
        ],
      ),
    );
  }
}
