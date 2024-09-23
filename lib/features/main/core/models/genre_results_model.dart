import '../entities/genre_results_entity.dart';
import 'genre_model.dart';

class GenreResultsModel extends GenreResultsEntity {
  const GenreResultsModel({
    required List<GenreModel> data,
  }) : super(
    data: data,
  );

  factory GenreResultsModel.fromEntity(GenreResultsEntity entity) {
    return GenreResultsModel(
      data: entity.data.map((genre) => GenreModel.fromEntity(genre)).toList(),
    );
  }

  factory GenreResultsModel.fromJson(Map<String, dynamic> json) {
    return GenreResultsModel(
      data: (json['genres'] as List<dynamic>)
          .map((genreJson) => GenreModel.fromJson(genreJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'genres': data.map((genre) => (genre as GenreModel).toJson()).toList(),
    };
  }

}
