import 'dart:convert';

import 'search_movie_model.dart';

class SearchMoviesResponseModel {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<SearchMovieModel> results;

  SearchMoviesResponseModel({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'total_pages': totalPages,
      'total_results': totalPages,
      'results': results.map((e) => e.toMap()).toList(),
    };
  }

  factory SearchMoviesResponseModel.fromMap(Map<String, dynamic> map) {
    return SearchMoviesResponseModel(
      page: map['page'],
      totalPages: map['total_pages'],
      totalResults: map['total_results'],
      results: map['results'] != null
          ? (map['results'] as List<dynamic>)
              .map((e) => SearchMovieModel.fromMap(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchMoviesResponseModel.fromJson(String source) =>
      SearchMoviesResponseModel.fromMap(json.decode(source));
}
