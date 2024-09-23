import 'package:dartz/dartz.dart';

import '../../../../app_core/entities/app_error.dart';
import '../../../../app_core/entities/no_params.dart';
import '../../../../app_core/usecases/usecase.dart';
import '../entities/movie_results_entity.dart';
import '../repository/main_repository.dart';

class GetMoviesUsecase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetMoviesUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) =>
      mainRepository.getMovieList();
}

class GetPopularMoviesUsecase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetPopularMoviesUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) =>
      mainRepository.getPopularMoviesList();
}

class GetTopRatedMoviesUsecase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetTopRatedMoviesUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) =>
      mainRepository.getTopRatedMoviesList();
}
