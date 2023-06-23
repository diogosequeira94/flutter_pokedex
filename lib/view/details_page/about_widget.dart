import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Abilities'),
            SizedBox(width: 20.0),
            Row(
              children: const [
                Text('Ability 1, '),
                Text('Ability 2'),
              ],
            )
          ],
        )
      ],
    );
  }
}
