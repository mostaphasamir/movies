import 'package:movie/movie/domain/entities/recommendation_movies.dart';

class RecommendationModel extends RecommendationMovies {
  const RecommendationModel({required super.id, super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> jsonData) {
    return RecommendationModel(
      id: jsonData['id'],
      backdropPath: jsonData['backdrop_path'],
    );
  }
}
