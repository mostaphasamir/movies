import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movie/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movie/movie/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movie/movie/presentation/controller/movies_event.dart';
import 'package:movie/movie/presentation/controller/movies_state.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../domain/use_cases/get_top_reated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase ;
  final GetPopularMoviesUseCase getPopularMoviesUseCase ;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase,this.getPopularMoviesUseCase,this.getTopRatedMoviesUseCase,) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingMoviesEvent);
    on<GetPopularMoviesEvent>(getPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(getTopRatedMoviesEvent);
  }

  FutureOr<void> getNowPlayingMoviesEvent(GetNowPlayingMoviesEvent event,
      Emitter<MoviesState> emit) async {
    final result =
    await getNowPlayingMoviesUseCase(const NoParameters());
    // emit(const MoviesState(nowPlayingState: RequestState.loaded));
    result.fold(
            (l) =>
            emit(
               MoviesState(nowPlayingState: RequestState.error,
                  nowPlayingMessage: l.message,),
            ),
            (r) => emit(MoviesState(nowPlayingState:RequestState.loaded,nowPlayingMovies: r)));
  }

  FutureOr<void> getPopularMoviesEvent(GetPopularMoviesEvent event, Emitter<MoviesState> emit)async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    // emit(const MoviesState(popularState: RequestState.loaded));
    result.fold(
            (l) =>
            emit(
              state.copyWith(popularState: RequestState.error,
                popularMessage: l.message,)
            ),
            (r) => emit(state.copyWith(popularState:RequestState.loaded,popularMovies: r)));
  }

  FutureOr<void> getTopRatedMoviesEvent(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
            (l) =>
            emit(
                state.copyWith(topRatedState: RequestState.error,
                  topRatedMessage: l.message,)
            ),
            (r) => emit(state.copyWith(topRatedState:RequestState.loaded,topRatedMovies: r)));

  }
}
