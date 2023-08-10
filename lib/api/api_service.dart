import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/models/character_model.dart';
import 'package:task/models/starship_model.dart';

class ApiService {
  final String baseUrl = 'https://swapi.dev/api';

  Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/people/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> characterList = data['results'];

      // Convert dynamic List to List<Character>
      List<Character> characters = characterList.map((characterData) {
        return Character.fromJson(characterData);
      }).toList();

      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<List<Starship>> getStarships() async {
    final response = await http.get(Uri.parse('$baseUrl/starships/'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> starshipList = data['results'];

      // Convert the starshipList to a List<Starship>
      List<Starship> starships = starshipList.map((starshipData) {
        return Starship.fromJson(starshipData);
      }).toList();

      return starships;
    } else {
      throw Exception('Failed to load starships');
    }
  }
}
