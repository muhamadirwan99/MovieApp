import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_application/common/style.dart';
import 'package:movie_application/data/api/api_service.dart';
import 'package:movie_application/data/models/movie_top_rated_model.dart';
import 'package:movie_application/modules/movie_detail/view_models/movie_detail_view_model.dart';
import 'package:movie_application/modules/movie_list/widget/headline.dart';
import 'package:movie_application/utils/result_state.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

class MovieDetailScreen extends StatefulWidget {
  static const routeName = '/menuDetailScreen';

  final Result movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('id');
    timeFormat = DateFormat.Hms('id');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieDetailViewModel>(
      create: (_) => MovieDetailViewModel(
          apiService: ApiService(), id: widget.movie.id.toString()),
      child: Consumer<MovieDetailViewModel>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (state.state == ResultState.HasData) {
            var detail = state.resultDetail;
            var image =
                "https://image.tmdb.org/t/p/w220_and_h330_face/${detail.posterPath}";

            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "Movie Detail",
                  style: myTextTheme.headline4,
                ),
              ),
              backgroundColor: neutral100,
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Container(
                              height: 230,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        2, 2), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 20,
                            child: Container(
                              width: 150.0,
                              height: 220,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(
                                        2, 2), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                    image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: neutral300,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 5,
                            child: Container(
                              height: 65.0,
                              width: 65.0,
                              decoration: const BoxDecoration(
                                color: blue500,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Rating",
                                      style: myTextTheme.headline6
                                          ?.copyWith(color: neutral100),
                                    ),
                                    Text(
                                      widget.movie.voteAverage.toString(),
                                      style: GoogleFonts.abrilFatface()
                                          .copyWith(
                                              color: neutral100,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80,
                            left: 190,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                    detail.title,
                                    style: myTextTheme.headline4?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                    dateFormat.format(detail.releaseDate),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Headline(value: "Overview"),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                detail.overview,
                                textAlign: TextAlign.justify,
                                style:
                                    GoogleFonts.roboto().copyWith(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
