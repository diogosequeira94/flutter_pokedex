import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:pokedex/view/details_page/about/about.dart';
import 'package:pokemon/pokemon.dart';

class AboutWidget extends StatelessWidget {
  final Pokemon pokemon;
  const AboutWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 8.0, right: 8.0),
      child: ListView(
        children: [
          _AboutItemWidget(
            title: 'Height',
            value: '${_formattedHeight(pokemon.height!).toString()} m',
          ),
          const SizedBox(height: 15.0),
          _AboutItemWidget(
            title: 'Weight',
            value: '${_formattedWeight(pokemon.weight!).toString()} kg',
          ),
          const SizedBox(height: 15.0),
          _AboutItemWidget(title: 'Habitat', value: pokemon.habitat),
          const SizedBox(height: 15.0),
          AbilitiesWidget(abilities: pokemon.abilities),
          const SizedBox(height: 5.0),
          WeaknessesWidget(types: pokemon.types),
        ],
      ),
    );
  }

  double _formattedWeight(int weight) {
    return (weight * 0.1).roundToDouble();
  }

  double _formattedHeight(int height) {
    return height / 10;
  }
}

class _AboutItemWidget extends StatelessWidget {
  final String title;
  final String? value;

  const _AboutItemWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: Constants.aboutEntryFontSize),
        ),
        const SizedBox(width: 20.0),
        Text(
          value ?? 'N/A',
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
