import 'dart:convert';

import 'package:cinemas/models/movie_detail_model.dart';
import 'package:cinemas/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev/';
  static const String comingSoon = 'coming-soon';
  static const String popular = 'popular';
  static const String nowPlaying = 'now-playing';
  static const String detail = 'movie?id=';

  static Future<List<MovieModel>> getComingSoon() async {
    final List<MovieModel> movieInstances = [];
    var url = Uri.parse('$baseUrl$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      //* Parses the string and returns the resulting Json object.
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getPopular() async {
    final List<MovieModel> movieInstances = [];
    var url = Uri.parse('$baseUrl$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      //* Parses the string and returns the resulting Json object.
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlaying() async {
    final List<MovieModel> movieInstances = [];
    var url = Uri.parse('$baseUrl$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)['results'];
      //* Parses the string and returns the resulting Json object.
      for (var movie in movies) {
        movieInstances.add(MovieModel.fromJson(movie));
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getDetailById(int id) async {
    var url = Uri.parse('$baseUrl$detail$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Error();
  }
}
