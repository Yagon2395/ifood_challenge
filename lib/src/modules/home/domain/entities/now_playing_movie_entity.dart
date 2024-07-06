import 'package:equatable/equatable.dart';

class NowPlayingMovieEntity extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String posterUrl;
  final List<int> genreIds;
  final String overview;

  const NowPlayingMovieEntity({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.posterUrl,
    required this.genreIds,
    required this.overview,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        voteAverage,
        posterUrl,
        genreIds,
        overview,
      ];
}
