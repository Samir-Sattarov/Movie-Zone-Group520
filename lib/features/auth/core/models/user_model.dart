// ignore_for_file: unused_import

import 'dart:math';

import '../../../main/core/models/movie_model.dart';
import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.name,
      required super.surname,
      required super.email,
      required super.favoriteMovies});

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      surname: entity.surname,
      email: entity.email,
      favoriteMovies: entity.favoriteMovies,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    Map<int, MovieModel> favoriteMovies = <int, MovieModel>{};

    final favoriteMoviesData =
        Map<String, Map<String, dynamic>>.from(json['favorite_movies']);

    favoriteMovies = favoriteMoviesData.map((key, value) {
      return MapEntry(int.parse(key), MovieModel.fromJson(value));
    });

    return UserModel(
      id: json['id'] ?? "",
      name: json['first_name'] ?? "",
      surname: json['last_name'] ?? "",
      email: json['email'] ?? "",
      favoriteMovies: favoriteMovies,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> favoriteMoviesJson = favoriteMovies.map(
      (key, value) {
        return MapEntry(key.toString(), MovieModel.fromEntity(value).toJson());
      },
    );

    return {
      'id': id,
      'first_name': name,
      'last_name': surname,
      'email': email,
      'favorite_movies': favoriteMoviesJson,
    };
  }
}
