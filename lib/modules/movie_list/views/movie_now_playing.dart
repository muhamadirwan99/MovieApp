import 'package:flutter/material.dart';
import 'package:movie_application/modules/movie_list/view_models/movie_now_playing_view_model.dart';
import 'package:movie_application/modules/movie_list/widget/card_now_playing.dart';
import 'package:movie_application/utils/result_state.dart';
import 'package:provider/provider.dart';

class MovieNowPlaying extends StatefulWidget {
  const MovieNowPlaying({Key? key}) : super(key: key);

  @override
  State<MovieNowPlaying> createState() => _MovieNowPlayingState();
}

class _MovieNowPlayingState extends State<MovieNowPlaying> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieNowPlayingViewModel>(
      builder: (context, state, _) {
        if (state.state == ResultState.Loading) {
          return const CircularProgressIndicator();
        } else if (state.state == ResultState.HasData) {
          return SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: state.result.results.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var movie = state.result.results[index];
                var image =
                    "https://image.tmdb.org/t/p/w220_and_h330_face/${movie.backdropPath}";
                return Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: CardNowPlaying(
                      image: image,
                      title: movie.title,
                      rating: movie.voteAverage.toString()),
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
