import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;

  final String title;

  final String backdropPath;

  final List<int> genderID;

  final String overview;

  final String releaseDate;

  final double voteAverage;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genderID,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props =>
      [id, title, backdropPath, genderID, overview, releaseDate, voteAverage];
}
