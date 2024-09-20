import 'package:equatable/equatable.dart';
import '../../../../app_core/api/api_constants.dart';
import '../entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.releaseDate,
  });

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      title: entity.title,
      description: entity.description,
      imageUrl: entity.imageUrl,
      releaseDate: entity.releaseDate,
    );
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      description: json['overview'],
      imageUrl:ApiConstants.imageUrl +  json['poster_path'],
      releaseDate: DateTime.parse(json['release_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'release_date': releaseDate.toIso8601String(),
    };
  }

}
