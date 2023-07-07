import 'package:get_it/get_it.dart';
import 'package:movie/movie/data/data_sources/movie_remote_data_source.dart';
import 'package:movie/movie/data/repositories/movie_repository.dart';
import 'package:movie/movie/domain/repositories/base_movies_repository.dart';
import 'package:movie/movie/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movie/movie/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movie/movie/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movie/movie/domain/use_cases/get_recommendation_movies_usecase.dart';
import 'package:movie/movie/domain/use_cases/get_top_reated_movies_usecase.dart';
import 'package:movie/movie/presentation/controller/movie_details_bloc.dart';
import 'package:movie/tvs/data/repositories/series_repository.dart';
import 'package:movie/tvs/domain/repositories/base_series_repository.dart';
import 'package:movie/tvs/domain/use_cases/get_onair_series_usecase.dart';
import 'package:movie/tvs/domain/use_cases/get_popular_series_usecase.dart';
import 'package:movie/tvs/presentation/controller/series_bloc.dart';

import '../../movie/presentation/controller/movies_bloc.dart';
import '../../tvs/data/data_sources/series_remote_data_sourse.dart';
import '../../tvs/domain/use_cases/get_top_rated_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
    sl.registerFactory(() => SeriesBloc(sl(), sl(), sl()));

    ///use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetOnAirSeriesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularSeriesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedSeriesUseCase(sl()));

    ///repo
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseSeriesRepository>(() => SeriesRepository(sl()));


    /// data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseRemoteSeriesDataSource>(() => RemoteSeriesDataSource());

  }
}
