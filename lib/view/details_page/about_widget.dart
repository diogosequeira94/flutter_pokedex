import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';

class AboutWidget extends StatelessWidget {
  final List<Ability> abilities;
  const AboutWidget({Key? key, required this.abilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Height'),
              SizedBox(width: 20.0),
              Text('2.0 m')
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            children: const [Text('Weight'), SizedBox(width: 20.0), Text('26kg')],
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              const Text('Abilities'),
              SizedBox(width: 20.0),
              Row(
                children: [
                  for(final ability in abilities)
                  Text(ability.name!),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
