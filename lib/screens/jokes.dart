import 'package:flutter/material.dart';
import 'package:msi_lab2/models/joke_model.dart';
import 'package:msi_lab2/services/api_service.dart';
import 'package:msi_lab2/widgets/joke/jokes_for_type_grid.dart';
import 'package:msi_lab2/widgets/my_app_bar.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokesScreen> {
  List<Joke> jokes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final type = ModalRoute.of(context)?.settings.arguments as String;
    if (type.isNotEmpty) {
      getJokes(type);
    }
  }

  void getJokes(String type) async {
    ApiService.getJokesForType(type).then((response) {
      setState(() {
        jokes = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: JokesForTypeGrid(
        jokes: jokes,
      ),
    );
  }
}
