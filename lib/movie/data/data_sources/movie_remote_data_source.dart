import 'package:dio/dio.dart';
import 'package:movie/core/network/api_constant.dart';
import 'package:movie/core/network/error_message_model.dart';
import 'package:movie/movie/data/models/movie_details_model.dart';
import 'package:movie/movie/data/models/movie_model.dart';
import 'package:movie/movie/data/models/recommendation_model.dart';
import 'package:movie/movie/domain/use_cases/get_recommendation_movies_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/use_cases/get_movie_details_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter);

  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{
    final response = await Dio().get(ApiConstant.nowPlayingMoviePath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async{

    final response = await Dio().get(ApiConstant.popularMoviePath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }


  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{

    final response = await Dio().get(ApiConstant.topRatedMoviePath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data['results']as List).map((e) => MovieModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }

  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter)async {
    final response = await Dio().get(ApiConstant.movieDetails(parameter.movieId));

    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameter parameter) async{
    final response = await Dio().get(ApiConstant.movieRecommendationPath(parameter.id));
    if(response.statusCode==200){
      return List<RecommendationModel>.from((response.data['results']as List).map((e) => RecommendationModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }

  }
}