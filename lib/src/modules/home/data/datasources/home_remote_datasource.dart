import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/data/datasources/constants.dart';
import '../../../core/data/datasources/server_exception.dart';
import '../models/genres_response_model.dart';
import '../models/now_playing_movies_response_model.dart';
import '../models/top_rated_movies_response_model.dart';
import 'home_datasource.dart';

class HomeRemoteDatasource implements HomeDatasource {
  final Dio _client;

  HomeRemoteDatasource({
    required Dio client,
  }) : _client = client;

  @override
  Future<TopRatedMoviesResponseModel> listTopRatedMovies(
      {required int page, required String locale}) async {
    try {
      final response = await _client
          .get('$tmdbBaseUrl/3/movie/top_rated?language=$locale&page=$page');

      if (response.statusCode != HttpStatus.ok) {
        throw ServerException(
          message: response.statusMessage ?? response.toString(),
          statusCode: response.statusCode,
        );
      }

      return TopRatedMoviesResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? e.toString(),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<NowPlayingMoviesResponseModel> listNowPlayingMovies(
      {required int page, required String locale}) async {
    try {
      final response = await _client
          .get('$tmdbBaseUrl/3/movie/now_playing?language=$locale&page=$page');

      if (response.statusCode != HttpStatus.ok) {
        throw ServerException(
          message: response.statusMessage ?? response.toString(),
          statusCode: response.statusCode,
        );
      }

      return NowPlayingMoviesResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? e.toString(),
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<GenresResponseModel> listGenres({required String locale}) async {
    try {
      final response =
          await _client.get('$tmdbBaseUrl/3/genre/movie/list?language=$locale');

      if (response.statusCode != HttpStatus.ok) {
        throw ServerException(
          message: response.statusMessage ?? response.toString(),
          statusCode: response.statusCode,
        );
      }

      return GenresResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? e.toString(),
        statusCode: e.response?.statusCode,
      );
    }
  }
}
