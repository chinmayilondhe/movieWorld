import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieWorld/widgets/movie_list_builder.dart';

import '../models/api_model.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({
    Key? key,
  }) : super(key: key);

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  List<String> movies = ["Harry Potter", "Finding Nemo", "Uri", "Avengers"];

  Movie movie = Movie(
      title: "",
      imgUrl: "",
      genre: "",
      rating: "",
      director: "",
      plot: "",
      actor: "",
      runtime: "");

  List<Movie> moviesItem = [];

  void getMovies(String title) async {
    var url = Uri.parse("https://www.omdbapi.com/?t=$title&apikey=ed61efbf");
    var response = await http.get(url);

    var responseData = jsonDecode(response.body);
    print(responseData);
    setState(() {
      Movie obj = Movie(
        title: responseData["Title"],
        imgUrl: responseData["Poster"],
        genre: responseData["Genre"],
        rating: responseData["Rated"],
        plot: responseData["Plot"],
        director: responseData["Director"],
        actor: responseData["Actors"],
        runtime: responseData["Runtime"],
      );

      movie = obj;
      moviesItem.add(movie);
    });
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < movies.length; i++) {
      getMovies(movies[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height,

        child: MovieListViewBuilder(moviesItem: moviesItem));
  }
}

