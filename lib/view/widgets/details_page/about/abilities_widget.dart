import 'package:flutter/material.dart';
import 'package:pokedex/utils/utils.dart';
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
          style: TextStyle(color: Colors.white, fontSize: Constants.aboutEntryFontSize),
        ),
        const SizedBox(width: 15.0),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: abilities.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  margin: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Constants.movePillBorderRadius),
                  ),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                    child: Text(abilities[i].ability!.name!.formatMove().capitalize()),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
    // Flexible(
    //   child: Wrap(
    //     alignment: WrapAlignment.start,
    //     children: [
    //       for (final ability in abilities)
    //         Card(
    //           margin: const EdgeInsets.all(4.0),
    //           shape: RoundedRectangleBorder(
    //             borderRadius:
    //                 BorderRadius.circular(Constants.movePillBorderRadius),
    //           ),
    //           elevation: 2.0,
    //           child: Padding(
    //             padding: const EdgeInsets.all(6.0),
    //             child:
    //                 Text(ability.ability!.name!.formatMove().capitalize()),
    //           ),
    //         ),
    //     ],
    //   ),
    // )
  }
}
