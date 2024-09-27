import '../../features/auth/core/entities/user_entity.dart';
import '../../features/main/core/entities/brand_entity.dart';
import '../../features/main/core/entities/genre_entity.dart';
import '../../features/main/core/entities/movie_entity.dart';
import '../../features/main/core/entities/set_entity.dart';

class TestData {

  static const List<BrandEntity> brands = [
    BrandEntity(
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
    ),
    BrandEntity(
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
    ),
    BrandEntity(
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
    ),
  ];

  static const List<GenreEntity> genres = [];

}
