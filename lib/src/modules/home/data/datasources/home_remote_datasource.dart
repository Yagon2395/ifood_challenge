import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/data/datasources/constants.dart';
import '../../../core/data/datasources/logger_interceptor.dart';
import '../../../core/data/datasources/server_exception.dart';
import '../../../core/data/datasources/tmdb_authentication_interceptor.dart';
import '../models/genres_response_model.dart';
import '../models/now_playing_movies_response_model.dart';
import '../models/top_rated_movies_response_model.dart';
import 'home_datasource.dart';

class HomeRemoteDatasource implements HomeDatasource {
  late final Dio _client;

  HomeRemoteDatasource({required Dio client, bool enableInterceptors = true}) {
    _client = client;

    if (enableInterceptors) {
      _client.interceptors.add(TMDBAuthenticationInterceptor());
      _client.interceptors.add(LoggerInterceptor());
    }
  }

  @override
  Future<TopRatedMoviesResponseModel> listTopRatedMovies(
      {required int page}) async {
    try {
      final response =
          await _client.get('$tmdbBaseUrl/3/movie/top_rated?page=$page');

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
      {required int page}) async {
    try {
      final response =
          await _client.get('$tmdbBaseUrl/3/movie/now_playing?page=$page');

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
  Future<GenresResponseModel> listGenres() async {
    try {
      final response = await _client.get('$tmdbBaseUrl/3/genre/movie/list');

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
