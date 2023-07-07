import 'package:movie/tvs/domain/entities/series.dart';

class SeriesModel extends Series {
  const SeriesModel(
      {required super.backdropPath,
      required super.genreIds,
      required super.id});

  factory SeriesModel.fromJson(Map<String, dynamic> jsonData) {
    return SeriesModel(
      backdropPath: jsonData['backdrop_path']??"/z5A5W3WYJc3UVEWljSGwdjDgQ0j.jpg",
      genreIds: List<int>.from(jsonData["genre_ids"]),
      id: jsonData['id'],
    );
  }
}
