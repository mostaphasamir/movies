import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usecase/base_usecase.dart';
import 'package:movie/tvs/domain/entities/series.dart';
import 'package:movie/tvs/domain/repositories/base_series_repository.dart';

class GetTopRatedSeriesUseCase extends BaseUseCase<List<Series>,NoParameters>{
  final BaseSeriesRepository baseSeriesRepository;

  GetTopRatedSeriesUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, List<Series>>> call(NoParameters parameters)async {
    return await baseSeriesRepository.getTopRatedSeries();
  }
}