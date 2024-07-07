import 'package:equatable/equatable.dart';

class SearchMovieEntity extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String posterUrl;
  final String backdropUrl;
  final String overview;

  const SearchMovieEntity({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.posterUrl,
    required this.backdropUrl,
    required this.overview,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        voteAverage,
        posterUrl,
        backdropUrl,
        overview,
      ];
}
