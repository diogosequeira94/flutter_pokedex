import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokemon/pokemon.dart';

class AbilitiesWidget extends StatelessWidget {
  final List<Abilities> abilities;
  const AbilitiesWidget({Key? key, required this.abilities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Abilities',
          style: TextStyle(
              color: Colors.white, fontSize: Constants.aboutEntryFontSize),
        ),
        const SizedBox(width: 15.0),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            for (final ability in abilities)
              Card(
                margin: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.movePillBorderRadius),
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
    );
  }
}
