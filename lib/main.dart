import 'package:flutter/material.dart';
import 'package:movie_application/common/navigation.dart';
import 'package:movie_application/common/style.dart';
import 'package:movie_application/data/api/api_service.dart';
import 'package:movie_application/data/models/movie_top_rated_model.dart';
import 'package:movie_application/modules/movie_detail/views/movie_detail_screen.dart';
import 'package:movie_application/modules/movie_list/view_models/movie_now_playing_view_model.dart';
import 'package:movie_application/modules/movie_list/view_models/movie_top_rated_view_model.dart';
import 'package:movie_application/modules/movie_list/views/movie_list_screen.dart';
import 'package:movie_application/modules/profile/views/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieNowPlayingViewModel(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => MovieTopRatedViewModel(
            apiService: ApiService(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primaryColor: blue500,
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: neutral100),
          appBarTheme: const AppBarTheme(
            backgroundColor: blue500,
          ),
          textTheme: myTextTheme,
        ),
        initialRoute: MovieListScreen.routeName,
        navigatorKey: navigatorKey,
        routes: {
          MovieListScreen.routeName: (context) => const MovieListScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          MovieDetailScreen.routeName: (context) => MovieDetailScreen(
              movie: ModalRoute.of(context)?.settings.arguments as Result),
        },
      ),
    );
  }
}
