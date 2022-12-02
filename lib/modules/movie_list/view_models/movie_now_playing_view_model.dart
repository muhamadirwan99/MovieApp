import 'package:flutter/cupertino.dart';
import 'package:movie_application/data/api/api_service.dart';
import 'package:movie_application/data/models/movie_list_now_playing_model.dart';
import 'package:movie_application/utils/result_state.dart';

class MovieNowPlayingViewModel extends ChangeNotifier {
  final ApiService apiService;

  MovieNowPlayingViewModel({required this.apiService}) {
    fetchNowPlayingMovieList();
  }

  late MovieNowPlayingResult _movieListResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  MovieNowPlayingResult get result => _movieListResult;

  ResultState get state => _state;

  Future<dynamic> fetchNowPlayingMovieList() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final movieList = await apiService.listNowPlayingMovie();
      if (movieList.results.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _movieListResult = movieList;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
