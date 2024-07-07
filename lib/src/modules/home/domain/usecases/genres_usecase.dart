import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/domain/failures/failures.dart';
import '../../../core/domain/usecases/base_usecase.dart';
import '../entities/genre_entity.dart';
import '../repositories/home_repository.dart';

class GenresUsecase
    implements InputableUsecase<List<GenreEntity>, GenresParams> {
  final HomeRepository _repository;

  GenresUsecase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<GenreEntity>>> call(
      {required GenresParams params}) async {
    return await _repository.listGenres(locale: params.locale);
  }
}

class GenresParams extends Equatable {
  final String locale;

  const GenresParams({required this.locale});

  @override
  List<Object?> get props => [locale];
}
