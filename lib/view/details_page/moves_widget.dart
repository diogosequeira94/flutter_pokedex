import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';
import 'package:pokedex/utils/extensions.dart';

class MovesWidget extends StatelessWidget {
  final List<Moves> moves;
  const MovesWidget({Key? key, required this.moves}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              for (final move in moves)
                Card(
                  margin: const EdgeInsets.all(4.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(move.move!.name!),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
