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

  Movie copyWith({
    String? title,
    String? imgUrl,
    String? genre,
    String? rating,
    String? director,
    String? actor,
    String? plot,
    String? runtime,
  }) {
    return Movie(
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      genre: genre ?? this.genre,
      rating: rating ?? this.rating,
      director: director ?? this.director,
      actor: actor ?? this.actor,
      plot: plot ?? this.plot,
      runtime: runtime ?? this.runtime,
    );
  }

  @override
  String toString() {
    return "{title:$title + genre:$genre + imgUrl:$imgUrl + rating:$rating + director:$director + actor:$actor+ plot:$plot + runtTime:$runtime}";
  }
}
