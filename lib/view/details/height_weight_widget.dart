import 'package:flutter/material.dart';

class HeightWeightWidget extends StatelessWidget {
  final int? height, weight;
  const HeightWeightWidget(
      {Key? key, required this.height, required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              'Height',
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('${(height! / 10).toString()} m'),
            ),
          ],
        ),
        const SizedBox(width: 40.0),
        Column(
          children: [
            const Text(
              'Weight',
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('${(weight! * 0.1).roundToDouble().toString()} kg'),
            ),
          ],
        ),
      ],
    );
  }
}
