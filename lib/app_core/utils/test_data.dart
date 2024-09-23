import '../../features/auth/core/entities/user_entity.dart';
import '../../features/main/core/entities/brand_entity.dart';
import '../../features/main/core/entities/genre_entity.dart';
import '../../features/main/core/entities/movie_entity.dart';
import '../../features/main/core/entities/set_entity.dart';

class TestData {
  static UserEntity user = UserEntity(
    name: "Mem",
    surname: "Testov",
    email: "test@gmail.com",
    favoriteMovies: [],
    id: '',
  );
  static List<SetEntity> sets = [
    SetEntity(title: "Popular movies", movies: movies),
    SetEntity(title: "TV series", movies: movies),
    SetEntity(title: "Sport", movies: movies),
    SetEntity(title: "Trillers", movies: movies),
  ];

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

  static List<MovieEntity> movies = [
    MovieEntity(
      title: "Test",
      description:
          "Я помню чудное мгновенье:Передо мной явилась ты, Как мимолетное виденье,Как гений чистой красоты.В томленьях грусти безнадежной,В тревогах шумной суеты,Звучал мне долго голос нежныйИ снились милые черты.Шли годы. Бурь порыв мятежныйРассеял прежние мечты,И я забыл твой голос нежный,Твои небесные черты.В глуши, во мраке заточеньяТянулись тихо дни моиБез божества, без вдохновенья,Без слез, без жизни, без любви.",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/zy/zy3l5o.jpg",
      releaseDate: DateTime.now(),
    ),
    MovieEntity(
      title: "Test",
      description: "TESTTTTTTSDKFJSDL:FJSD:FJKDSF:LSJDFLKJ",
      imageUrl: "https://th.wallhaven.cc/small/x6/x6yzoz.jpg",
      releaseDate: DateTime.now(),
    ),
  ];
}
