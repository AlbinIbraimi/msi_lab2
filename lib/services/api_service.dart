import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:msi_lab2/models/joke_model.dart';

class ApiService {
  static const _baseUrl = 'https://official-joke-api.appspot.com';

  static Future<T> baseGet<T>(
    String endpoint,
    T Function(dynamic json) parseJson,
  ) async {
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));

    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      return parseJson(jsonData);
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }

  static Future<List<String>> getJokeTypes() async {
    return baseGet<List<String>>(
      '/types',
      (json) => (json as List<dynamic>).cast<String>(),
    );
  }

  static Future<List<Joke>> getJokesForType(String type) async {
    return baseGet<List<Joke>>(
      '/jokes/$type/ten',
      (json) => (json as List<dynamic>)
          .map((element) => Joke.fromJson(element))
          .toList(),
    );
  }

  static Future<Joke> getJokeOfTheDay() async {
    return baseGet<Joke>(
      '/random_joke',
      (json) => Joke.fromJson(json),
    );
  }
}
