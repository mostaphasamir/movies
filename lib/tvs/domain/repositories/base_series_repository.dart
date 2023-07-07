import 'package:dartz/dartz.dart';
import 'package:movie/tvs/domain/entities/series.dart';

import '../../../core/error/failure.dart';

abstract class BaseSeriesRepository {
  Future<Either<Failure,List<Series>>> getOnAirSeries();
  Future<Either<Failure,List<Series>>> getPopularSeries();
  Future<Either<Failure,List<Series>>> getTopRatedSeries();
}