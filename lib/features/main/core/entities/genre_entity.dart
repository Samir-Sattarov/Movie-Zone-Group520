import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  final String title;

  const GenreEntity({
    required this.title,
  });

  @override
  List<Object?> get props => [
        title,
      ];
}
