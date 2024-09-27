import 'package:equatable/equatable.dart';
import '../../../../app_core/api/api_constants.dart';
import '../entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.releaseDate,
  });

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      imageUrl: entity.imageUrl,
      releaseDate: entity.releaseDate,
    );
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final posterPath = json['poster_path'];
    String poster = ApiConstants.noFoundImageUrl;

    if (posterPath != null) {
      poster = ApiConstants.imageUrl + posterPath;
    }

    return MovieModel(
      id: json['id'],
      title: json['title'],
      description: json['overview'],
      imageUrl: poster,
      releaseDate: DateTime.tryParse(json['release_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': description,
      'poster_path': imageUrl.replaceAll(ApiConstants.imageUrl, ""),
      'release_date': releaseDate?.toIso8601String(),
    };
  }
}
