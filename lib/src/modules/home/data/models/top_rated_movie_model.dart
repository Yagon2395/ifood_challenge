import 'dart:convert';

class TopRatedMovieModel {
  final int id;
  final String title;
  final double voteAverage;
  final String backdropPath;

  TopRatedMovieModel({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.backdropPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'vote_average': voteAverage,
      'backdrop_path': backdropPath,
    };
  }

  factory TopRatedMovieModel.fromMap(Map<String, dynamic> map) {
    return TopRatedMovieModel(
      id: map['id'],
      title: map['title'],
      voteAverage: map['vote_average'],
      backdropPath: map['backdrop_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TopRatedMovieModel.fromJson(String source) =>
      TopRatedMovieModel.fromMap(json.decode(source));
}
