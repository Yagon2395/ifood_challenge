import 'dart:convert';

import 'now_playing_movie_model.dart';

class NowPlayingMoviesResponseModel {
  final int page;
  final int totalPages;
  final List<NowPlayingMovieModel> results;

  NowPlayingMoviesResponseModel({
    required this.page,
    required this.totalPages,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'totalPages': totalPages,
      'results': results.map((e) => e.toMap()).toList(),
    };
  }

  factory NowPlayingMoviesResponseModel.fromMap(Map<String, dynamic> map) {
    return NowPlayingMoviesResponseModel(
      page: map['page'],
      totalPages: map['total_pages'],
      results: map['results'] != null
          ? (map['results'] as List<dynamic>)
              .map((e) =>
                  NowPlayingMovieModel.fromMap(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory NowPlayingMoviesResponseModel.fromJson(String source) =>
      NowPlayingMoviesResponseModel.fromMap(json.decode(source));
}
