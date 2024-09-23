import 'package:equatable/equatable.dart';

import 'genre_entity.dart';

class GenreResultsEntity extends Equatable{
  final List<GenreEntity> data;

  const GenreResultsEntity({required this.data});

  @override
  List<Object?> get props => [data.length];
}