import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;

  final int id;

  final String imdbId;
  final String overview;

  final String releaseDate;

  final int runtime;

  final String title;

  final double voteAverage;

  const MovieDetails({
    required this.genres,
    required this.backdropPath,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        backdropPath,
        id,
        imdbId,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}
