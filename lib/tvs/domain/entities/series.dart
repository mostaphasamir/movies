import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final String backdropPath;

  final List<int> genreIds;

  final int id;

  const Series({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
  });

  @override
  List<Object> get props => [
        backdropPath,
        genreIds,
        id,
      ];
}
