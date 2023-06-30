import 'package:pokedex/cubit/generation/model/pokemon_basic_item.dart';
import 'package:pokemon/pokemon.dart';

final mockPokemonList = [
  const PokemonBasicItem(name: 'Mew', number: 151),
  const PokemonBasicItem(name: 'Pikachu', number: 25),
  const PokemonBasicItem(name: 'Raichu', number: 26),
  const PokemonBasicItem(name: 'Rattata', number: 28),
  const PokemonBasicItem(name: 'Raticate', number: 29),
  const PokemonBasicItem(name: 'Mewtwo', number: 150),
];

const mockPokemon = Pokemon(
  name: 'bulbasaur',
  id: 1,
  height: 20,
  weight: 20,
  abilities: [],
  habitat: 'Mountain',
  moves: [],
  stats: [],
  types: [],
);

const mockSpeciesResponse = SpeciesResponse(
  flavorTextEntries: [FlavorTextEntries(flavorText: 'This pokemon lives in water')],
  eggGroups: [EggGroups(name: 'Carp')],
  habitat: Habitat(name: 'Water'),
  isBaby: false,
  isLegendary: false,
  isMythical: false,
);

const mockEvolutionList = [
  Evolution(
    name: 'Ivysaur',
    id: '2',
    imageUrl: 'imageUrl',
    evolutions: ['001', '002', '003'],
    evolvedFrom: '001',
    reason: 'Level Up',
  ),
  Evolution(
    name: 'Venusaur',
    id: '3',
    imageUrl: 'imageUrl',
    evolutions: ['001', '002', '003'],
    evolvedFrom: '002',
    reason: 'Level Up',
  ),
];
