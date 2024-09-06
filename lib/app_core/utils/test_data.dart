import '../../features/main/core/entities/brand_entity.dart';
import '../../features/main/core/entities/movie_entity.dart';
import '../../features/main/core/entities/set_entity.dart';

class TestData {
  static List<SetEntity> sets = [
    SetEntity(title: "Popular movies", movies: movies),
    SetEntity(title: "TV series", movies: movies),
  ];

  static List<BrandEntity> brands = [
    const BrandEntity(
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
    ),
    BrandEntity(
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
    ),
    BrandEntity(
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
    ),
  ];

  static List<MovieEntity> movies = [
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: false,
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: true,
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: false,
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: true,
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: false,
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: true,
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: false,
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
      age: 2020,
      duration: 100,
      newEpisodes: true,
    ),
  ];
}
