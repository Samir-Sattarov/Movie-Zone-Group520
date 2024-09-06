import 'package:equatable/equatable.dart';

import 'movie_entity.dart';

class SetEntity extends Equatable {
  final String title;
  final List<MovieEntity> movies;

  const SetEntity({required this.title, required this.movies});

  @override
  List<Object?> get props => [title, movies.length];
}
