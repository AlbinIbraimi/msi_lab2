import 'package:flutter/material.dart';
import 'package:msi_lab2/screens/home.dart';
import 'package:msi_lab2/screens/joke_of_the_day.dart';
import 'package:msi_lab2/screens/jokes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '181171',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/jokes': (context) => const JokesScreen(),
        '/jokeOfTheDay': (context) => const JokeOfTheDay()
      },
    );
  }
}
