import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/movie.dart';

class Api {
  static const String apiKey = '9c2f0ada85abce310958785de988c4fb';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/popular?api_key$apiKey'),
    );

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Falha ao carregar filmes populares');
    }
  }
}