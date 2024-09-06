import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final String title;
  final String imageUrl;

  const GenreEntity({
    required this.imageUrl,
    required this.title,
  });

  @override
  List<Object?> get props => [
        title,
        imageUrl,
      ];
}
