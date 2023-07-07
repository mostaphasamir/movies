import 'package:dio/dio.dart';
import 'package:movie/tvs/data/models/series_model.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/network/error_message_model.dart';

abstract class BaseRemoteSeriesDataSource {
  Future<List<SeriesModel>> getOnAirSeries();
  Future<List<SeriesModel>> getPopularSeries();
  Future<List<SeriesModel>> getTopRatedSeries();
}


class RemoteSeriesDataSource extends BaseRemoteSeriesDataSource{

  @override
  Future<List<SeriesModel>> getOnAirSeries() async {
    final response = await Dio().get(ApiConstant.onAirSeriesPath);
    if(response.statusCode==200){
      return List<SeriesModel>.from((response.data['results']as List).map((e) => SeriesModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

  @override
  Future<List<SeriesModel>> getPopularSeries() async {
    final response = await Dio().get(ApiConstant.popularSeriesPath);
    if(response.statusCode==200){
      return List<SeriesModel>.from((response.data['results']as List).map((e) => SeriesModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

  @override
  Future<List<SeriesModel>> getTopRatedSeries() async {
    final response = await Dio().get(ApiConstant.topRatedSeriesPath);
    if(response.statusCode==200){
      return List<SeriesModel>.from((response.data['results']as List).map((e) => SeriesModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data)) ;
    }
  }

}