import 'package:flutter/material.dart';
import 'package:pokedex/utils/color_utils.dart';
import 'package:pokemon/pokemon.dart';
import 'package:pokedex/utils/extensions.dart';

class TypePillsWidget extends StatelessWidget {
  final List<PokeTypes> types;
  const TypePillsWidget({Key? key, required this.types}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final type in types)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 90,
              decoration: BoxDecoration(
                color: ColorUtils.getPillTypeColor(type.type!.name!),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Center(
                  child: Text(
                type.type!.name!.capitalize(),
                style: const TextStyle(color: Colors.white),
              )),
            ),
          ),
      ],
    );
  }
}
