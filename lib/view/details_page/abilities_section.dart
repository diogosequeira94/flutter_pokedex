import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';
import 'package:pokedex/utils/extensions.dart';

class AbilitiesSection extends StatelessWidget {
  final List<Abilities> abilities;
  const AbilitiesSection({Key? key, required this.abilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Abilities',
          style: TextStyle(fontSize: 24.0),
        ),
        const SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (final abilities in abilities)
              Text(
                  abilities.ability?.name?.capitalize() ?? 'Unknown'),
          ],
        ),
      ],
    );
  }
}
