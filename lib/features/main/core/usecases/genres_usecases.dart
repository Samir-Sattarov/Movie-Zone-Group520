import 'package:dartz/dartz.dart';

import '../../../../app_core/entities/app_error.dart';
import '../../../../app_core/entities/no_params.dart';
import '../../../../app_core/usecases/usecase.dart';
import '../entities/genre_results_entity.dart';
import '../entities/movie_results_entity.dart';
import '../repository/main_repository.dart';

class GetGenresUsecase extends UseCase<GenreResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetGenresUsecase(this.mainRepository);

  @override
  Future<Either<AppError, GenreResultsEntity>> call(NoParams params) =>
      mainRepository.getGenresList();
}
