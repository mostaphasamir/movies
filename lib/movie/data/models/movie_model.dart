import 'package:movie/movie/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genderID,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path']??"/z5A5W3WYJc3UVEWljSGwdjDgQ0j.jpg",
      genderID: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
