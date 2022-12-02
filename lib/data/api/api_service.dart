import 'dart:convert';

import 'package:movie_application/data/models/detail_movie_model.dart';
import 'package:movie_application/data/models/movie_list_now_playing_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_application/data/models/movie_top_rated_model.dart';

class ApiService {
  static const String _apiKey = '1e6a3a26e31ff7d7b36096f14da05883';
  static const String _baseUrl = 'https://api.themoviedb.org/3/movie/';

  static const String _movieNowPlaying =
      '${_baseUrl}now_playing?api_key=$_apiKey&language=en-US&page=1';
  static const String _movieTopRated =
      '${_baseUrl}top_rated?api_key=$_apiKey&language=en-US&page=1';
  static const String _detailMovie = '?api_key=$_apiKey&&language=en-US';

  Future<MovieNowPlayingResult> listNowPlayingMovie() async {
    final response = await http.get(Uri.parse(_movieNowPlaying));
    if (response.statusCode == 200) {
      return MovieNowPlayingResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  Future<MovieTopRatedResult> listTopRatedMovie() async {
    final response = await http.get(Uri.parse(_movieTopRated));
    if (response.statusCode == 200) {
      return MovieTopRatedResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  Future<MovieDetailResult> detailMovie(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + id + _detailMovie));
    if (response.statusCode == 200) {
      return MovieDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail movies');
    }
  }
}
