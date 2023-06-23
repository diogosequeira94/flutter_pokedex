import 'package:flutter/material.dart';

class PokeDescription extends StatelessWidget {
  final String description;
  const PokeDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
