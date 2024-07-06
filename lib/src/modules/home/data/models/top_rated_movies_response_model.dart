import 'dart:convert';

import 'top_rated_movie_model.dart';

class TopRatedMoviesResponseModel {
  final int page;
  final int totalPages;
  final List<TopRatedMovieModel> results;

  TopRatedMoviesResponseModel({
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

  factory TopRatedMoviesResponseModel.fromMap(Map<String, dynamic> map) {
    return TopRatedMoviesResponseModel(
      page: map['page'],
      totalPages: map['total_pages'],
      results: map['results'] != null
          ? (map['results'] as List<dynamic>)
              .map((e) => TopRatedMovieModel.fromMap(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TopRatedMoviesResponseModel.fromJson(String source) =>
      TopRatedMoviesResponseModel.fromMap(json.decode(source));
}
