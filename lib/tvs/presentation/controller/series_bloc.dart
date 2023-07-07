import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/tvs/domain/use_cases/get_onair_series_usecase.dart';
import 'package:movie/tvs/presentation/controller/series_state.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../domain/use_cases/get_popular_series_usecase.dart';
import '../../domain/use_cases/get_top_rated_usecase.dart';

part 'series_event.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final GetOnAirSeriesUseCase getOnAirSeriesUseCase;

  final GetPopularSeriesUseCase getPopularSeriesUseCase;

  final GetTopRatedSeriesUseCase getTopRatedUseCase;

  SeriesBloc(
    this.getOnAirSeriesUseCase,
    this.getPopularSeriesUseCase,
    this.getTopRatedUseCase,
  ) : super(const SeriesState()) {
    on<GetOnAirSeriesEvent>(getOnAirSeriesEvent);
    on<GetPopularSeriesEvent>(getPopularSeriesEvent);
    on<GetTopRatedSeriesEvent>(getTopRatedSeriesEvent);
  }

  FutureOr<void> getOnAirSeriesEvent(
      GetOnAirSeriesEvent event, Emitter<SeriesState> emit) async {
    final result = await getOnAirSeriesUseCase(const NoParameters());
    result.fold(
        (l) => emit(SeriesState(
              onAirState: RequestState.error,
              onAirMessage: l.message,
            )),
        (r) =>
            emit(SeriesState(onAirState: RequestState.loaded, onAirSeries: r)));
  }

  Future<FutureOr<void>> getPopularSeriesEvent(
      GetPopularSeriesEvent event, Emitter<SeriesState> emit) async {
    final result = await getPopularSeriesUseCase(const NoParameters());
    result.fold((l) => emit(state.copyWith(
      popularState: RequestState.error,
      popularMessage: l.message
    )), (r) => emit(state.copyWith(
      popularState: RequestState.loaded,
      popularSeries: r,
    )));
  }

  Future<FutureOr<void>> getTopRatedSeriesEvent(
      GetTopRatedSeriesEvent event, Emitter<SeriesState> emit) async {
    final result = await getTopRatedUseCase(const NoParameters());
    result.fold((l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: l.message
    )), (r) => emit(state.copyWith(
      topRatedState: RequestState.loaded,
      topRatedSeries: r,
    )));
  }
}
