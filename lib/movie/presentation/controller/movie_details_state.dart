part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;

  final RequestState detailsRequestState;

  final String movieMessage;

  final List<RecommendationMovies> recommendationMovies;

  final RequestState recommendationRequestState;

  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetails,
    this.detailsRequestState = RequestState.loading,
    this.movieMessage = "",
    this.recommendationMovies = const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? detailsRequestState,
    String? movieMessage,
    List<RecommendationMovies>? recommendationMovies,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        detailsRequestState: detailsRequestState ?? this.detailsRequestState,
        movieMessage: movieMessage ?? this.movieMessage,
        recommendationMovies: recommendationMovies ?? this.recommendationMovies,
        recommendationRequestState: recommendationRequestState ??
            this.recommendationRequestState,
        recommendationMessage: recommendationMessage ??
            this.recommendationMessage
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetails,
        detailsRequestState,
        movieMessage,
        recommendationMovies,
        recommendationRequestState,
        recommendationMessage,
      ];
}
