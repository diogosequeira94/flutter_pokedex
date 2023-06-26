import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/utils/utils.dart';

void main() {
  test('capitalizes first letter', () {
    const pokemon = 'charmander';
    expect(pokemon.capitalize(), 'Charmander');
  });

  test('formats moves list', () {
    const movesList = [
      'razor-wind',
      'mega-punch',
      'fire-punch',
    ];

    expect(movesList[0].formatMove(), 'razor wind');
    expect(movesList[1].formatMove(), 'mega punch');
    expect(movesList[2].formatMove(), 'fire punch');
  });

  test('formats texts with line breaks', () {
   const unformattedText = 'This\nis\na\npokemon';
   expect(unformattedText.formatTrivia(), 'This is a pokemon');
  });

}
