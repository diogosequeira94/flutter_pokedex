import 'package:flutter/material.dart';
import 'package:pokedex/utils/constants.dart';

class PokeDescription extends StatelessWidget {
  final String description;
  const PokeDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.descriptionHorizontalPadding),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: Constants.descriptionFontSize),
      ),
    );
  }
}
