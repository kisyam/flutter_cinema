class MovieDetailModel {
  final bool adult;
  final String backdropPath;
  final List<Map<String, dynamic>> genres;
  final int id;
  final String overview;
  final String posterPath;
  final int runtime;
  final String title;
  final double voteAverage;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        genres = json['genres'].cast<Map<String, dynamic>>(),
        id = json['id'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        runtime = json['runtime'],
        title = json['title'],
        voteAverage = json['vote_average'].toDouble();
}
