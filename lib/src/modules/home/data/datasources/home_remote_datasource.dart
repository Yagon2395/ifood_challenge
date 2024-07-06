import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ifood_challenge/src/modules/home/data/models/top_rated_movies_response_model.dart';

import '../../../core/data/datasources/constants.dart';
import '../../../core/data/datasources/logger_interceptor.dart';
import '../../../core/data/datasources/server_exception.dart';
import '../../../core/data/datasources/tmdb_authentication_interceptor.dart';
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
}
