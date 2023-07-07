import 'package:equatable/equatable.dart';

class RecommendationMovies extends Equatable {
  final int id;

  final String ? backdropPath;

  const RecommendationMovies({
    required this.id,
    this.backdropPath,
  });

  @override
  List<Object?> get props => [id, backdropPath];
}