import 'dart:convert';

class SearchMovieModel {
  final int id;
  final String title;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;
  final String overview;

  SearchMovieModel({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'vote_average': voteAverage,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'overview': overview,
    };
  }

  factory SearchMovieModel.fromMap(Map<String, dynamic> map) {
    return SearchMovieModel(
      id: map['id'],
      title: map['title'],
      voteAverage: map['vote_average'],
      posterPath: map['poster_path'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      overview: map['overview'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchMovieModel.fromJson(String source) =>
      SearchMovieModel.fromMap(json.decode(source));
}
