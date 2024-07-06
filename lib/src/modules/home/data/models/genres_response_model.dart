import 'dart:convert';

import 'genre_model.dart';

class GenresResponseModel {
  final List<GenreModel> genres;

  GenresResponseModel({required this.genres});

  Map<String, dynamic> toMap() {
    return {
      'genres': genres.map((e) => e.toMap()).toList(),
    };
  }

  factory GenresResponseModel.fromMap(Map<String, dynamic> map) {
    return GenresResponseModel(
      genres: map['genres'] != null
          ? (map['genres'] as List<dynamic>)
              .map((e) => GenreModel.fromMap(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory GenresResponseModel.fromJson(String source) =>
      GenresResponseModel.fromMap(json.decode(source));
}
