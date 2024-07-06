import 'package:dartz/dartz.dart';

import '../../../core/domain/failures/failures.dart';
import '../../../core/domain/usecases/base_usecase.dart';
import '../entities/genre_entity.dart';
import '../repositories/home_repository.dart';

class GenresUsecase implements InputlessUsecase<List<GenreEntity>> {
  final HomeRepository _repository;

  GenresUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<GenreEntity>>> call() async {
    return await _repository.listGenres();
  }
}
