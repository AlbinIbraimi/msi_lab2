import 'package:flutter/material.dart';
import 'package:msi_lab2/models/joke_model.dart';
import 'package:msi_lab2/widgets/joke/joke_card.dart';

class JokesForTypeGrid extends StatefulWidget {
  final List<Joke> jokes;
  const JokesForTypeGrid({super.key, required this.jokes});

  @override
  State<JokesForTypeGrid> createState() => _JokeTypeGrid();
}

class _JokeTypeGrid extends State<JokesForTypeGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            widget.jokes.map((element) => JokeCard(joke: element)).toList());
  }
}
