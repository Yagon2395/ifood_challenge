import 'package:dartz/dartz.dart';

import '../../../core/data/datasources/server_exception.dart';
import '../../../core/domain/failures/failures.dart';
import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/now_playing_movies_result_entity.dart';
import '../../domain/entities/top_rated_movies_result_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_datasource.dart';
import '../mappers/genre_mapper.dart';
import '../mappers/now_playing_movies_result_mapper.dart';
import '../mappers/top_rated_movies_result_mapper.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _dataSource;

  HomeRepositoryImpl({required HomeDatasource datasource})
      : _dataSource = datasource;

  @override
  Future<Either<Failure, TopRatedMoviesResultEntity>> listTopRatedMovies(
      {required int page, required String locale}) async {
    try {
      final response = await _dataSource.listTopRatedMovies(
        page: page,
        locale: locale,
      );
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

  @override
  Future<Either<Failure, NowPlayingMoviesResultEntity>> listNowPlayingMovies(
      {required int page, required String locale}) async {
    try {
      final response = await _dataSource.listNowPlayingMovies(
        page: page,
        locale: locale,
      );
      return Right(NowPlayingMoviesResultMapper.toEntity(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.toString(),
        statusCode: e.statusCode,
      ));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GenreEntity>>> listGenres(
      {required String locale}) async {
    try {
      final response = await _dataSource.listGenres(locale: locale);
      return Right(
          response.genres.map((e) => GenreMapper.toEntity(e)).toList());
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
