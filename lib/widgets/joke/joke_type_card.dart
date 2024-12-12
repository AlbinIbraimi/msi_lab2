import 'package:flutter/material.dart';

class JokeTypeCard extends StatelessWidget {
  final String jokeType;

  const JokeTypeCard({super.key, required this.jokeType});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () =>
            {Navigator.pushNamed(context, '/jokes', arguments: jokeType)},
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              jokeType,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
