import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/api/api_service.dart';
import 'package:task/models/character_model.dart';
import 'package:task/models/starship_model.dart';
import 'package:task/provider/favorites_provider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ApiService apiService = ApiService();
  late FavoritesProvider favoritesProvider;

  List<Character> characters = [];
  List<Starship> starships = [];

  @override
  Widget build(BuildContext context) {
    favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Star Wars App'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              characters = await apiService.getCharacters();
              starships = await apiService.getStarships();
              setState(() {});
            },
            child: Text('Load Data'),
          ),
          Text('Characters'),
          Expanded(
            child: ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                Character character = characters[index];
                bool isCharacterFavorite =
                    favoritesProvider.isCharacterFavorite(character);

                return ListTile(
                  title: Text(character.name),
                  subtitle: Text(
                      'Height: ${character.height} | Mass: ${character.mass}'),
                  trailing: IconButton(
                    icon: Icon(isCharacterFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      favoritesProvider.toggleFavoriteCharacter(character);
                      setState(() {}); // Update UI after toggling
                    },
                  ),
                );
              },
            ),
          ),
          Text('Starships'),
          Expanded(
            child: ListView.builder(
              itemCount: starships.length,
              itemBuilder: (context, index) {
                Starship starship = starships[index];
                bool isStarshipFavorite =
                    favoritesProvider.isStarshipFavorite(starship);

                return ListTile(
                  title: Text(starship.name),
                  subtitle: Text(
                      'Model: ${starship.model} | Manufacturer: ${starship.manufacturer}'),
                  trailing: IconButton(
                    icon: Icon(isStarshipFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      favoritesProvider.toggleFavoriteStarship(starship);
                      setState(() {}); // Update UI after toggling
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
