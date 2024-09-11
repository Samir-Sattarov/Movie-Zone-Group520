import 'package:equatable/equatable.dart';

class LanguageEntity extends Equatable {
  final String title;
  final String image;
  final String langCode;

  const LanguageEntity(
      {required this.title, required this.image, required this.langCode});

  @override
  List<Object?> get props => [
        title,
        image,
        langCode,
      ];
}
