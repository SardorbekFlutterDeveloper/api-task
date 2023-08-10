import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/favorites_page.dart';
import 'package:task/pages/home_page.dart';
import 'package:task/provider/favorites_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/favorites': (context) => FavoritesPage(),
      },
    );
  }
}
