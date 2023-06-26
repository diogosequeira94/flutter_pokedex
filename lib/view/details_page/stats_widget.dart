import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';

class StatsWidget extends StatelessWidget {
  final List<Stats> statsList;
  const StatsWidget({Key? key, required this.statsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const maxContainerWidth = 300.0;
    const maxContainerHeight = 21.0;
    const statsPillRadius = 40.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
      child: Column(
        children: [
          for (final stats in statsList)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _getStatTag(stats.stat!.name!),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: maxContainerHeight,
                            width: maxContainerWidth,
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(statsPillRadius),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                          ),
                          Container(
                            height: maxContainerHeight,
                            width: _calculateStatFillWidth(maxContainerWidth, stats.value!),
                            decoration: BoxDecoration(
                              color: _getStatColor(stats.stat!.name!),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(statsPillRadius),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                            child: Center(
                              child: Text(
                                '${stats.value.toString()}/150',
                                style: const TextStyle(color: Colors.transparent, fontSize: 11.5),
                              ),
                            ),
                          ),
                          Container(
                            height: maxContainerHeight,
                            width: maxContainerWidth,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(statsPillRadius),
                              ),
                              border: Border.all(
                                color: Colors.white, //                   <--- border color
                                width: 1.0,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Text(
                          '${stats.value.toString()}/150',
                          style: const TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  double _calculateStatFillWidth(double maxWidth, int value) {
    return (maxWidth / 1.5) * (value / 100) > maxWidth ? maxWidth : (maxWidth / 1.5) * (value / 100);
  }

  String _getStatTag(String statName) {
    switch (statName) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SPA';
      case 'special-defense':
        return 'SPD';
      case 'speed':
        return 'SPE';
    }
    return 'EXP';
  }

  Color _getStatColor(String statName) {
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
