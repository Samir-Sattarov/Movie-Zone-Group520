import '../entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({
    required super.title,
  });

  factory GenreModel.fromEntity(GenreEntity entity) {
    return GenreModel(
      title: entity.title,
    );
  }

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      title: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': title,
    };
  }
}
