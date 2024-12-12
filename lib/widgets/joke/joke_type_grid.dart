import 'package:flutter/material.dart';
import 'package:msi_lab2/widgets/joke/joke_type_card.dart';

class JokeTypeGrid extends StatefulWidget {
  final List<String> jokeTypes;
  const JokeTypeGrid({super.key, required this.jokeTypes});

  @override
  State<JokeTypeGrid> createState() => _JokeTypeGrid();
}

class _JokeTypeGrid extends State<JokeTypeGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.jokeTypes
            .map((jokeType) => JokeTypeCard(jokeType: jokeType))
            .toList());
  }
}
