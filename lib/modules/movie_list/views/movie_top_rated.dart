import 'package:flutter/material.dart';
import 'package:movie_application/modules/movie_detail/views/movie_detail_screen.dart';
import 'package:movie_application/modules/movie_list/view_models/movie_top_rated_view_model.dart';
import 'package:movie_application/modules/movie_list/widget/card_top_rated.dart';
import 'package:movie_application/utils/result_state.dart';
import 'package:provider/provider.dart';

class MovieTopRated extends StatelessWidget {
  const MovieTopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieTopRatedViewModel>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const CircularProgressIndicator();
        } else if (state.state == ResultState.HasData) {
          return Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: state.result.results.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var movie = state.result.results[index];
                var image =
                    "https://image.tmdb.org/t/p/w220_and_h330_face/${movie.backdropPath}";
                return Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CardTopRated(
                      image: image,
                      title: movie.title,
                      rating: movie.voteAverage.toString(),
                      popular: movie.popularity.toString(),
                      date: movie.releaseDate,
                      onChanged: () {
                        Navigator.pushNamed(
                            context, MovieDetailScreen.routeName,
                            arguments: movie);
                      }),
                );
              },
            ),
          );
        } else if (state.state == ResultState.NoData) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsuRK4UnlY0iCfygunUTaUzK1iba_BjqdK2UOIzBMGSnMzp4djSbJX4VUaLCwlBhLx8iA&usqp=CAU",
                width: 64.0,
                height: 64.0,
                fit: BoxFit.fill,
              ),
            ),
          );
        } else if (state.state == ResultState.Error) {
          return Center(
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsuRK4UnlY0iCfygunUTaUzK1iba_BjqdK2UOIzBMGSnMzp4djSbJX4VUaLCwlBhLx8iA&usqp=CAU",
              width: 64.0,
              height: 64.0,
              fit: BoxFit.fill,
            ),
          );
        } else {
          return const Center(child: Text(''));
        }
      },
    );
  }
}
