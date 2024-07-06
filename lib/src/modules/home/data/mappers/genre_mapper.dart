import '../../domain/entities/genre_entity.dart';
import '../models/genre_model.dart';

abstract class GenreMapper {
  static GenreEntity toEntity(GenreModel model) {
    return GenreEntity(
      id: model.id,
      name: model.name,
    );
  }
}
