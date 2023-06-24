import 'package:flutter/material.dart';
import 'package:pokedex/view/details_page/about/weaknesses_utils.dart';
import 'package:pokemon/pokemon.dart';

class WeaknessesWidget extends StatelessWidget {
  final List<PokeTypes> types;
  const WeaknessesWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weaknesses = calculateWeaknesses(types);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              for (final weakness in weaknesses)
                Card(
                  margin: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(weakness),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> calculateWeaknesses(List<PokeTypes> types) {
    List<String> weaknesses = List.empty();

    for (int i = 0; i < types.length; i++) {
      List<String> tempWeaknesses =
          WeaknessesUtils.getWeaknesses(types[i].type!.name!);
      weaknesses.addAll(tempWeaknesses);
    }

    return weaknesses.toSet().toList();
  }
}
