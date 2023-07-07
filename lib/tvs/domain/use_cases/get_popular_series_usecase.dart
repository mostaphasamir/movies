import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/series.dart';
import '../repositories/base_series_repository.dart';

class GetPopularSeriesUseCase extends BaseUseCase<List<Series>,NoParameters>{
  final BaseSeriesRepository baseSeriesRepository ;


  GetPopularSeriesUseCase(this.baseSeriesRepository);

  @override
  Future<Either<Failure, List<Series>>> call(parameters) async{
    return await baseSeriesRepository.getPopularSeries();
  }
}