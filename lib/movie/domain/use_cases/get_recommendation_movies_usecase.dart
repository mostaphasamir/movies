import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/movie/domain/repositories/base_movies_repository.dart';

import '../entities/recommendation_movies.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<List<RecommendationMovies>,RecommendationParameter> {
  final BaseMoviesRepository baseMoviesRepository ;


  GetRecommendationMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationMovies>>> call(RecommendationParameter parameters)async {
    return await baseMoviesRepository.getRecommendationMovies(parameters);
  }

}


class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter({
    required this.id,
  });

  @override
  List<Object> get props => [id];

}