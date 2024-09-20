import 'package:equatable/equatable.dart';

import 'movie_entity.dart';

class MovieResultsEntity extends Equatable{
  final List<MovieEntity> data;

  const MovieResultsEntity({required this.data});

  @override
  List<Object?> get props => [data.length];
}