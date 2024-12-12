import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:msi_lab2/models/joke_model.dart';

class ApiService {
  static Future<List<String>> getJokeTypes() async {
    getJokesForType("programming");
    final response = await http
        .get(Uri.parse('https://official-joke-api.appspot.com/types'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.cast<String>();
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  static Future<List<Joke>> getJokesForType(String type) async {
    final response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/$type/ten"));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((element) => Joke.fromJson(element)).toList();
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
