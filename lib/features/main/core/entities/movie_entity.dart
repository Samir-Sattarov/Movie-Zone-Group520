import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String description;
  final DateTime? releaseDate;
  final String imageUrl;

  const MovieEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        title,
        description,
      ];
}
