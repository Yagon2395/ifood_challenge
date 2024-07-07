import 'package:dartz/dartz.dart';

import '../../../core/data/datasources/server_exception.dart';
import '../../../core/domain/failures/failures.dart';
import '../../domain/entities/search_movies_result_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_datasource.dart';
import '../mappers/search_movies_result_mapper.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource _dataSource;

  SearchRepositoryImpl({required SearchDatasource datasource})
      : _dataSource = datasource;

  @override
  Future<Either<Failure, SearchMoviesResultEntity>> searchMovies(
      {required int page,
      required String locale,
      required String keyword}) async {
    try {
      final response = await _dataSource.searchMovies(
        page: page,
        locale: locale,
        keyword: keyword,
      );
      return Right(SearchMoviesResultMapper.toEntity(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
        statusCode: e.statusCode,
      ));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
