import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String description;
  final DateTime releaseDate;
  final String imageUrl;
  final int age;
  final int duration;
  final bool newEpisodes;

  const MovieEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.releaseDate,
    required this.age,
    required this.duration,
    required this.newEpisodes,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        age,
      ];
}
