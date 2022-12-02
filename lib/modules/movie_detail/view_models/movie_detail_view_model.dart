import 'package:flutter/cupertino.dart';
import 'package:movie_application/data/api/api_service.dart';
import 'package:movie_application/data/models/detail_movie_model.dart';
import 'package:movie_application/utils/result_state.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final ApiService apiService;
  String? id;

  MovieDetailViewModel({required this.apiService, this.id}) {
    _fetchDetailMovie(id!);
  }
  late MovieDetailResult _movieDetail;

  late ResultState _state;
  String _message = '';

  String get message => _message;

  MovieDetailResult get resultDetail => _movieDetail;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailMovie(String id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final movieDetail = await apiService.detailMovie(id);

      _state = ResultState.HasData;
      notifyListeners();
      return _movieDetail = movieDetail;
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
