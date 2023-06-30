import 'package:flutter/material.dart';

class ColorUtils {
  static Color getPillTypeColor(String typeName) {
    switch (typeName) {
      case 'grass':
        return Colors.green;
      case 'water':
        return Colors.blueAccent;
      case 'ice':
        return Colors.blue;
      case 'fire':
        return Colors.red;
      case 'poison':
        return Colors.purple;
      case 'bug':
        return Colors.teal;
      case 'normal':
        return Colors.brown.shade100;
      case 'flying':
        return Colors.blueGrey;
      case 'psychic':
        return Colors.purpleAccent;
      case 'fighting':
        return Colors.brown;
      case 'fairy':
        return Colors.pinkAccent;
      case 'ground':
        return Colors.brown.shade700;
      case 'rock':
        return Colors.black45;
      case 'ghost':
        return Colors.indigo;
      case 'dragon':
        return Colors.redAccent.shade400;
      case 'steel':
        return Colors.grey.shade700;
    }
    return Colors.amber;
  }

  static Color getStatColor(String statName) {
    switch (statName) {
      case 'hp':
        return Colors.red;
      case 'attack':
        return Colors.orange;
      case 'defense':
        return Colors.blue;
      case 'special-attack':
        return Colors.amber;
      case 'special-defense':
        return Colors.blueAccent.shade700;
      case 'speed':
        return Colors.black54;
    }
    return Colors.pink;
  }
}
