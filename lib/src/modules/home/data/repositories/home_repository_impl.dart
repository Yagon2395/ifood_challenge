import 'package:dartz/dartz.dart';
import 'package:ifood_challenge/src/modules/home/domain/entities/top_rated_movies_result_entity.dart';

import '../../../core/data/datasources/server_exception.dart';
import '../../../core/domain/failures/failures.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_datasource.dart';
import '../mappers/top_rated_movies_result_mapper.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _dataSource;

  HomeRepositoryImpl({required HomeDatasource datasource})
      : _dataSource = datasource;

  @override
  Future<Either<Failure, TopRatedMoviesResultEntity>> listTopRatedMovies(
      {required int page}) async {
    try {
      final response = await _dataSource.listTopRatedMovies(page: page);
      return Right(TopRatedMoviesResultMapper.toEntity(response));
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
