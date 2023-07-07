import 'package:dartz/dartz.dart';
import 'package:movie/movie/domain/entities/movie.dart';
import 'package:movie/movie/domain/use_cases/get_recommendation_movies_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation_movies.dart';
import '../use_cases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure,List<Movie> > > getNowPlayingMovies();
  Future<Either<Failure,List<Movie> > > getPopularMovies();
  Future<Either<Failure,List<Movie> > >  getTopRatedMovies();

  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailsParameters parameters);


  Future<Either<Failure,List<RecommendationMovies>>> getRecommendationMovies(RecommendationParameter parameters);
}