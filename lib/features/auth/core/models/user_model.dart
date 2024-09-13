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
    return UserModel(
      id: json['id'] ?? "",
      name: json['first_name'] ?? "",
      surname: json['last_name'] ?? "",
      email: json['email'] ?? "",
      favoriteMovies: List<Map<String, dynamic>>.from(json['favorite_movies'])
          .map((e) => MovieModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': name,
      'last_name': surname,
      'email': email,
      'favorite_movies':
          favoriteMovies.map((e) => MovieModel.fromEntity(e).toJson()),
    };
  }
}
