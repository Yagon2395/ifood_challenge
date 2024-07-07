import 'dart:convert';

class NowPlayingMovieModel {
  final int id;
  final String title;
  final double voteAverage;
  final String posterPath;
  final List<int> genreIds;
  final String overview;

  NowPlayingMovieModel({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
    required this.genreIds,
    required this.overview,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'vote_average': voteAverage,
      'poster_path': posterPath,
      'genre_ids': genreIds,
      'overview': overview,
    };
  }

  factory NowPlayingMovieModel.fromMap(Map<String, dynamic> map) {
    return NowPlayingMovieModel(
      id: map['id'],
      title: map['title'],
      voteAverage: map['vote_average'],
      posterPath: map['poster_path'] ?? '',
      genreIds: map['genre_ids'] != null
          ? (map['genre_ids'] as List<dynamic>).map((e) => e as int).toList()
          : [],
      overview: map['overview'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NowPlayingMovieModel.fromJson(String source) =>
      NowPlayingMovieModel.fromMap(json.decode(source));
}
