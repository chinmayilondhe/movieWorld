import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  static const String id = "movie_description";

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> movieData =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    print("2nd screen : ${movieData["title"]}");
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.25,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade300,
                    Colors.indigo.shade500,
                    Colors.purple.shade400,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 200),
                height: MediaQuery.of(context).size.height - 200,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(36))),
                clipBehavior: Clip.antiAlias,
              ),
              Positioned(
                top: 250,
                left: 200,
                right: 16,
                child: FittedBox(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${movieData["title"]}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Director: ${movieData["director"]}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Runtime: ${movieData["runtime"]}",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Text("${movieData["genre"]}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Rating: ${movieData["rating"]}",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 120,
                  left: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      movieData["imgUrl"].toString(),
                      height: 250,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 1.75,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Plot Summary",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "${movieData["plot"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Cast & Crew",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text("${movieData["actors"]}",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 24),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Give Review",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ],
      )),
    );
  }
}
