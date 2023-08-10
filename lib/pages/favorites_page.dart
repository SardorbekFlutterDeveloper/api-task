import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/favorites_provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Characters and Starships'),
      ),
      body: Column(
        children: [
          // Display favorite characters and starships using ListView.builder
        ],
      ),
    );
  }
}
