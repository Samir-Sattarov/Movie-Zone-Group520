import 'package:equatable/equatable.dart';


class BrandEntity extends Equatable {
  final String imageUrl;

  const BrandEntity({required this.imageUrl});

  @override
  List<Object?> get props => [
        imageUrl,
      ];
}
