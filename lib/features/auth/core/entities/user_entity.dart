import 'package:equatable/equatable.dart';

import '../../../main/core/entities/movie_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String surname;
  final String email;
  final List<MovieEntity> favoriteMovies;

  const UserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.favoriteMovies,
  });

  factory UserEntity.empty() {
    return const UserEntity(
      id: '',
      name: '',
      email: '',
      surname: '',
      favoriteMovies: [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
      ];
}
