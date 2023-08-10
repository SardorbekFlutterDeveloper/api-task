import 'package:flutter/material.dart';
import 'package:task/models/character_model.dart';
import 'package:task/models/starship_model.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Character> favoriteCharacters = [];
  List<Starship> favoriteStarships = [];

  // Other methods...

  bool isCharacterFavorite(Character character) {
    return favoriteCharacters.contains(character);
  }

  bool isStarshipFavorite(Starship starship) {
    return favoriteStarships.contains(starship);
  }

  void toggleFavoriteCharacter(Character character) {
    if (favoriteCharacters.contains(character)) {
      favoriteCharacters.remove(character);
    } else {
      favoriteCharacters.add(character);
    }
    notifyListeners();
  }

  void toggleFavoriteStarship(Starship starship) {
    if (favoriteStarships.contains(starship)) {
      favoriteStarships.remove(starship);
    } else {
      favoriteStarships.add(starship);
    }
    notifyListeners();
  }
}
