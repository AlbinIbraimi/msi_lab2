import 'package:flutter/material.dart';
import 'package:msi_lab2/widgets/joke/joke_type_grid.dart';
import '../services/api_service.dart';
import 'package:msi_lab2/widgets/my_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokeTypes();
  }

  // fetch joke types
  void getJokeTypes() async {
    ApiService.getJokeTypes().then((response) {
      setState(() {
        jokeTypes = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: JokeTypeGrid(
        jokeTypes: jokeTypes,
      ),
    );
  }
}
