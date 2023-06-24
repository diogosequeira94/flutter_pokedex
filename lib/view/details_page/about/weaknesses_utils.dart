class WeaknessesUtils {
  static List<String> getWeaknesses(String type) {
    switch (type) {
      case 'Normal':
        return ['Fighting'];
      case 'Fire':
        return ['Water', 'Ground', 'Rock'];
      case 'Water':
        return ['Grass', 'Electric'];
      case 'Grass':
        return ['Fire', 'Ice', 'Poison', 'Flying', 'Bug'];
      case 'Electric':
        return ['Ground'];
      case 'Ice':
        return ['Fire', 'Fighting', 'Rock', 'Steel'];
      case 'Fighting':
        return ['Flying', 'Psychic', 'Fairy'];
      case 'Poison':
        return ['Grass', 'Psychic'];
      case 'Ground':
        return ['Water', 'Grass', 'Ice'];
      case 'Flying':
        return ['Electric', 'Ice', 'Rock'];
      case 'Psychic':
        return ['Bug', 'Ghost', 'Dark'];
      case 'Bug':
        return ['Flying', 'Rock', 'Fire'];
      case 'Rock':
        return ['Water', 'Grass', 'Fighting', 'Ground', 'Steel'];
      case 'Ghost':
        return ['Ghost', 'Dark'];
      case 'Dragon':
        return ['Ice', 'Dragon', 'Fairy'];
      case 'Dark':
        return ['Fighting', 'Bug', 'Fairy'];
      case 'Steel':
        return ['Fire', 'Fighting', 'Ground'];
      case 'Fairy':
        return ['Poison', 'Steel'];
    }
    return ['No Weaknesses'];
  }
}
