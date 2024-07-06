import 'dart:convert';

import 'top_rated_movie_model.dart';

class TopRatedMoviesResponseModel {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<TopRatedMovieModel> results;

  TopRatedMoviesResponseModel({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'total_pages': totalPages,
      'total_results': totalResults,
      'results': results.map((e) => e.toMap()).toList(),
    };
  }

  factory TopRatedMoviesResponseModel.fromMap(Map<String, dynamic> map) {
    return TopRatedMoviesResponseModel(
      page: map['page'],
      totalPages: map['total_pages'],
      totalResults: map['total_results'],
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
