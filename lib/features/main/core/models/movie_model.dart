import 'package:equatable/equatable.dart';
import '../entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required String title,
    required String description,
    required String imageUrl,
    required DateTime releaseDate,
    required int age,
    required int duration,
    required bool newEpisodes,
  }) : super(
          title: title,
          description: description,
          imageUrl: imageUrl,
          releaseDate: releaseDate,
          age: age,
          duration: duration,
          newEpisodes: newEpisodes,
        );

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      title: entity.title,
      description: entity.description,
      imageUrl: entity.imageUrl,
      releaseDate: entity.releaseDate,
      age: entity.age,
      duration: entity.duration,
      newEpisodes: entity.newEpisodes,
    );
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      releaseDate: DateTime.parse(json['release_date']),
      age: json['age'],
      duration: json['duration'],
      newEpisodes: json['new_episodes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'release_date': releaseDate.toIso8601String(),
      'age': age,
      'duration': duration,
      'new_episodes': newEpisodes,
    };
  }

  @override
  List<Object?> get props => [title, description, age];
}
