import 'package:equatable/equatable.dart';

class TopRatedMovieEntity extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String backdropUrl;

  const TopRatedMovieEntity({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.backdropUrl,
  });

  @override
  List<Object?> get props => [id, title, voteAverage, backdropUrl];
}
