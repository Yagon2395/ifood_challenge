import 'package:dio/dio.dart';

import '../../../core/data/datasources/constants.dart';
import '../../../core/data/datasources/server_exception.dart';
import '../models/search_movies_response_model.dart';
import 'search_datasource.dart';

class SearchRemoteDatasource implements SearchDatasource {
  final Dio _client;

  SearchRemoteDatasource({
    required Dio client,
  }) : _client = client;

  @override
  Future<SearchMoviesResponseModel> searchMovies(
      {required int page,
      required String locale,
      required String keyword}) async {
    try {
      final response = await _client.get(
          '$tmdbBaseUrl/3/search/movie?query=$keyword&language=$locale&page=$page');
      return SearchMoviesResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message: e.message ?? e.toString(),
        statusCode: e.response?.statusCode,
      );
    }
  }
}
