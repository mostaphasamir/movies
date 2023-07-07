part of 'series_bloc.dart';

abstract class SeriesEvent extends Equatable {
  const SeriesEvent();
  @override
  List<Object?> get props => [];
}

class GetOnAirSeriesEvent extends SeriesEvent {}
class GetPopularSeriesEvent extends SeriesEvent{}
class GetTopRatedSeriesEvent extends SeriesEvent{}
