import 'package:dartz/dartz.dart';
import 'package:movie/movie/domain/repositories/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository ;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie> > > call(NoParameters parameters){
    return baseMoviesRepository.getPopularMovies();
  }
}