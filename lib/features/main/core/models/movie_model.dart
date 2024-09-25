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
    final posterPath = json['poster_path'];
    String poster = ApiConstants.noFoundImageUrl;

    if (posterPath != null) {
      poster = ApiConstants.imageUrl + posterPath;
    }


    return MovieModel(
      title: json['title'],
      description: json['overview'],
      imageUrl: poster,
      releaseDate: DateTime.tryParse(json['release_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'overview': description,
      'poster_path': imageUrl.replaceAll(ApiConstants.imageUrl, ""),
      'release_date': releaseDate?.toIso8601String(),
    };
  }
}
