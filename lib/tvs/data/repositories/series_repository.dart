import 'package:dartz/dartz.dart';
import 'package:movie/core/error/exceptions.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/tvs/data/data_sources/series_remote_data_sourse.dart';
import 'package:movie/tvs/domain/entities/series.dart';
import 'package:movie/tvs/domain/repositories/base_series_repository.dart';

class SeriesRepository extends BaseSeriesRepository {
final BaseRemoteSeriesDataSource baseRemoteSeriesDataSource ;


SeriesRepository(this.baseRemoteSeriesDataSource);

  @override
  Future<Either<Failure, List<Series>>> getOnAirSeries()async {
    final result =await baseRemoteSeriesDataSource.getOnAirSeries();
    try{
      return Right(result);
    } on ServerException catch(exception){
      return Left(ServerFailure(exception.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries()async {
    final result = await baseRemoteSeriesDataSource.getPopularSeries();
    try{
      return Right(result);
    } on ServerException catch(exception){
      return Left(ServerFailure(exception.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getTopRatedSeries() async {
    final result =await baseRemoteSeriesDataSource.getTopRatedSeries();
    try{
      return Right(result);
    } on ServerException catch(exception)
    {
      return Left(ServerFailure(exception.errorMessageModel.statusMessage));
    }
  }

}