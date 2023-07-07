import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movie/domain/entities/recommendation_movies.dart';
import 'package:movie/movie/domain/use_cases/get_movie_details_usecase.dart';

import '../../domain/entities/movie_details.dart';
import '../../domain/use_cases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendationMoviesUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetailsEvent);
    on<GetRecommendedMoviesEvent>(getRecommendedMoviesEvent);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  FutureOr<void> getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            detailsRequestState: RequestState.error, movieMessage: l.message)),
        (r) => emit(state.copyWith(
            detailsRequestState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> getRecommendedMoviesEvent(GetRecommendedMoviesEvent event, Emitter<MovieDetailsState> emit)async {
    final result =
        await getRecommendationMoviesUseCase(RecommendationParameter(id: event.id));
    result.fold(
            (l) => emit(state.copyWith(
            recommendationRequestState: RequestState.error, recommendationMessage:  l.message)),
            (r) => emit(state.copyWith(
            recommendationRequestState: RequestState.loaded, recommendationMovies: r)));
  }
}
