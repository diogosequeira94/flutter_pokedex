import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/view/details_page/about/weaknesses_utils.dart';
import 'package:pokemon/pokemon.dart';

class WeaknessesWidget extends StatelessWidget {
  final List<PokeTypes> types;
  const WeaknessesWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weaknesses = calculateWeaknesses(types);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weaknesses',
          style: TextStyle(color: Colors.white, fontSize: Constants.aboutEntryFontSize),
        ),
        const SizedBox(width: 15.0),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            for (final weakness in weaknesses)
              Card(
                color: _getPillColor(weakness),
                margin: const EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(weakness, style: const TextStyle(color: Colors.white),),
                ),
              ),
          ],
        ),
      ],
    );
  }

  List<String> calculateWeaknesses(List<PokeTypes> types) {
    List<String> weaknesses = [];

    for (int i = 0; i < types.length; i++) {
      List<String> tempWeaknesses =
          WeaknessesUtils.getWeaknesses(types[i].type!.name!.capitalize());
      weaknesses.addAll(tempWeaknesses);
    }

    return weaknesses.toSet().toList();
  }

  Color _getPillColor(String typeName){
    switch(typeName){
      case 'Grass':
        return Colors.green;
      case 'Water':
        return Colors.blueAccent;
      case 'Ice':
        return Colors.blue;
      case 'Fire':
        return Colors.red;
      case 'Poison':
        return Colors.purple;
      case 'Bug':
        return Colors.teal;
      case 'Normal':
        return Colors.brown.shade100;
      case 'Flying':
        return Colors.blueGrey;
      case 'Psychic':
        return Colors.purpleAccent;
      case 'Fighting':
        return Colors.brown;
      case 'Fairy':
        return Colors.pinkAccent;
      case 'Ground':
        return Colors.brown.shade700;
      case 'Rock':
        return Colors.black45;
      case 'Ghost':
        return Colors.indigo;
      case 'Dragon':
        return Colors.redAccent.shade400;
    }
    return Colors.amber;
  }
}
