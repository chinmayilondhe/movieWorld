class Movie {
  final String title;
  final String imgUrl;
  final String genre;
  final String rating;
  final String director;
  final String actor;
  final String plot;
  final String runtime;

  Movie(
      {required this.director,
        required this.actor,
        required this.plot,
        required this.title,
        required this.imgUrl,
        required this.genre,
        required this.rating,
        required this.runtime});

}
