class Movie {
  final String title;
  final String overview;
  final String posterUrl;
  final String releaseDate;

  Movie({
    required this.title,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'release_date': releaseDate,
      'overview': overview,
      'poster_path': posterUrl,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      overview: json['overview'],
      posterUrl: json['poster_path'],
      releaseDate: json['release_date'],
    );
  }
}
