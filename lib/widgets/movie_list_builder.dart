
import 'package:flutter/material.dart';
import 'package:movieWorld/models/api_model.dart';
import 'package:movieWorld/views/movie_description.dart';

class MovieListViewBuilder extends StatelessWidget {
  const MovieListViewBuilder({
    Key? key,
    required this.moviesItem,
  }) : super(key: key);

  final List<Movie> moviesItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
        });
  }
}