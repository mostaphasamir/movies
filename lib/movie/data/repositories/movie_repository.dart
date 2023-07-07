import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:movie/movie/domain/entities/movie.dart';
import 'package:movie/movie/domain/entities/movie_details.dart';
import 'package:movie/movie/domain/entities/recommendation_movies.dart';
import 'package:movie/movie/domain/repositories/base_movies_repository.dart';
import 'package:movie/movie/domain/use_cases/get_recommendation_movies_usecase.dart';

import '../../domain/use_cases/get_movie_details_usecase.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource ;


  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie> > > getNowPlayingMovies() async{
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie> > > getPopularMovies() async{

    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }

  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies()async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailsParameters parameters)async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationMovies>>> getRecommendationMovies(RecommendationParameter parameters)async {
    final result = await baseMovieRemoteDataSource.getRecommendationMovies(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}