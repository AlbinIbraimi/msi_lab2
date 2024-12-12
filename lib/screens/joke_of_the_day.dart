import 'package:flutter/material.dart';
import 'package:msi_lab2/models/joke_model.dart';
import '../services/api_service.dart';
import 'package:msi_lab2/widgets/my_app_bar.dart';

class JokeOfTheDay extends StatefulWidget {
  const JokeOfTheDay({super.key});

  @override
  State<JokeOfTheDay> createState() => _JokeOfTheDay();
}

class _JokeOfTheDay extends State<JokeOfTheDay> {
  Joke? jokeOfTheDay;

  @override
  void initState() {
    super.initState();
    getJokeOfTheDay();
  }

  void getJokeOfTheDay() async {
    ApiService.getJokeOfTheDay().then((response) {
      setState(() {
        jokeOfTheDay = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Type: ${jokeOfTheDay?.type ?? ""}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 3, 93, 9),
                  ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  jokeOfTheDay?.setup ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  jokeOfTheDay?.punchline ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
