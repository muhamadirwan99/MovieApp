import 'package:flutter/material.dart';
import 'package:movie_application/common/style.dart';
import 'package:movie_application/modules/movie_list/views/movie_now_playing.dart';
import 'package:movie_application/modules/movie_list/views/movie_top_rated.dart';
import 'package:movie_application/modules/movie_list/widget/headline.dart';
import 'package:movie_application/modules/profile/views/profile_screen.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  static const routeName = '/menuListScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Movie Application",
          style: myTextTheme.headline4,
        ),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.person,
                size: 24.0,
              ),
            ),
            onTap: () =>
                {Navigator.pushNamed(context, ProfileScreen.routeName)},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24, top: 24),
              alignment: Alignment.centerLeft,
              child: const Headline(value: "Now Showing"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const MovieNowPlaying(),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: const Headline(value: "Top Rated"),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: const MovieTopRated(),
            ),
          ],
        ),
      ),
    );
  }
}
