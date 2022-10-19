import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/api_model.dart';
import '../views/movie_description.dart';

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

  void getMoives(String title) async {
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
      getMoives(movies[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height,

        child: ListView.builder(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: moviesItem.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MovieDescription.id, arguments: {
                    "title": moviesItem[index].title,
                    "genre": moviesItem[index].genre,
                    "plot": moviesItem[index].plot,
                    "director": moviesItem[index].director,
                    "actors": moviesItem[index].actor,
                    "runtime": moviesItem[index].runtime,
                    "rating": moviesItem[index].rating,
                    "imgUrl": moviesItem[index].imgUrl,
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 125,
                      margin: const EdgeInsets.only(
                        top: 60,
                        bottom: 16,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lightBlue.shade200,
                              offset: Offset(2, 2),
                              spreadRadius: 1,
                              blurRadius: 16,
                            )
                          ]),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(moviesItem[index].title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5)),
                            Text(moviesItem[index].genre,
                                style: TextStyle(color: Colors.grey)),
                            Text("Rating: ${moviesItem[index].rating}",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              moviesItem[index].imgUrl,
                              height: 150,
                            )),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
