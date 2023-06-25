import 'package:flutter/material.dart';
import 'package:movie_poster/widget/movie_widget.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var emptyPopularMoviesList = [];

  @override
  void initState() {
    super.initState();
    getTheMovieFromApi();
  }

  getTheMovieFromApi() async {
    String apiKey = "c962cd1431ca9bbc6b50fc8ec19e079e";
    String apiReadAccessToken =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOTYyY2QxNDMxY2E5YmJjNmI1MGZjOGVjMTllMDc5ZSIsInN1YiI6IjY0OTAyYjQwYzNjODkxMDEwY2E1ZmI1OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sReFUdd9BUo2-D7Iy0PkcdN5CbgwIKFck2xBXcHGBdc";

    try {
      final tmdb = TMDB(
        ApiKeys(apiKey, apiReadAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ),
      );

      // Map result = await tmdb.v3.trending.getTrending();
      Map popularMovies = await tmdb.v3.movies.getPopular();
      print(popularMovies);
      emptyPopularMoviesList = popularMovies["results"];

      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieList(emptyPopularMoviesLists: emptyPopularMoviesList),
    );
  }
}
