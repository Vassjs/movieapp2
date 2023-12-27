class Movie {
  final String title;
  final String backDropPath;
  final String overview;
  final String posterPath;
  final String releaseYear;
  final double? rating;


  Movie({
    required this.title,
    required this.overview,
    required this.releaseYear,
    required this.rating,
    required this.backDropPath,
    required this.posterPath
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json['title'] ??'',
      backDropPath: json['backdrop_path'] ?? '',
      releaseYear: json['release_date'] ??'',
      rating: json['vote_average'] ??'',
      overview: json['overview'] ??'',
      posterPath: json['poster_path'] ?? ''
    );
  }
}