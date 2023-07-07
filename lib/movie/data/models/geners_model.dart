import 'package:movie/movie/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String,dynamic> jsonData){
    return GenresModel(id: jsonData['id'], name: jsonData['name']);
  }
}
