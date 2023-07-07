import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/series.dart';

class SeriesState extends Equatable {

  final List<Series> onAirSeries;

  final RequestState onAirState;

  final String onAirMessage;

  final List<Series> popularSeries;

  final RequestState popularState;

  final String popularMessage;

  final List<Series> topRatedSeries;

  final RequestState topRatedState;

  final String topRatedMessage;

  const SeriesState({
    this.onAirSeries = const [],
    this.onAirState = RequestState.loading,
    this.onAirMessage = '',
    this.popularSeries = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedSeries = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });


  SeriesState copyWith({
    List<Series>? onAirSeries,

    RequestState? onAirState,

    String? onAirMessage,

    List<Series>? popularSeries,

    RequestState? popularState,

    String? popularMessage,

    List<Series> ?topRatedSeries,

    RequestState ?topRatedState,

    String? topRatedMessage,
  }){
    return SeriesState(
      onAirSeries: onAirSeries ??this.onAirSeries ,
      onAirState: onAirState??this.onAirState  ,
      onAirMessage: onAirMessage??this.onAirMessage ,
      popularSeries: popularSeries??this.popularSeries,
      popularState: popularState??this.popularState ,
      popularMessage: popularMessage??this.popularMessage ,
      topRatedSeries: topRatedSeries??this.topRatedSeries ,
      topRatedState: topRatedState ?? this.topRatedState ,
      topRatedMessage: topRatedMessage ??this.topRatedMessage ,
    );
  }
  @override
  List<Object> get props =>
      [
        onAirSeries,
        onAirState,
        onAirMessage,
        popularSeries,
        popularState,
        popularMessage,
        topRatedSeries,
        topRatedState,
        topRatedMessage,
      ];
}
