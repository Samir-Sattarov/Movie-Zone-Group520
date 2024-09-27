import 'package:equatable/equatable.dart';

import '../../../main/core/entities/movie_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String email;
  final Map<int, MovieEntity> favoriteMovies;

  const UserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.favoriteMovies,
  });

  setFavoriteMovie(MovieEntity movie) => favoriteMovies[movie.id] = movie;
  deleteFavoriteMovie(MovieEntity movie) => favoriteMovies.remove(movie.id);

  factory UserEntity.empty() {
    return const UserEntity(
      id: '',
      name: '',
      email: '',
      surname: '',
      favoriteMovies: <int, MovieEntity>{},
    );
  }

  UserEntity copyWith({
    String? name,
    String? surname,
    String? email,
  }) {
    return UserEntity(
      id: id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      favoriteMovies: favoriteMovies,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
      ];
}
