import 'package:movie/movie/data/models/geners_model.dart';
import 'package:movie/movie/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.id,
    required super.imdbId,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieDetailsModel(
      genres: List<GenresModel>.from(jsonData["genres"].map((e) => GenresModel.fromJson(e))),
      backdropPath: jsonData['backdrop_path']??"/z5A5W3WYJc3UVEWljSGwdjDgQ0j.jpg",
      id: jsonData['id'],
      imdbId: jsonData['imdb_id'],
      overview: jsonData['overview'],
      releaseDate: jsonData['release_date'],
      runtime: jsonData['runtime'],
      title: jsonData['title'],
      voteAverage: jsonData['vote_average'].toDouble(),
    );
  }
}
