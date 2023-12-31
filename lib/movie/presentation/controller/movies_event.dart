import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable{


  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}
class GetPopularMoviesEvent extends MoviesEvent {}
class GetTopRatedMoviesEvent extends MoviesEvent {}