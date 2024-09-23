import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app_core/app_core_library.dart';
import '../../../core/entities/movie_results_entity.dart';
import '../../../core/usecases/movie_usecases.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  PopularMoviesCubit(this.getPopularMoviesUsecase)
      : super(PopularMoviesInitial());

  load() async {
    emit(PopularMoviesLoading());

    final response = await getPopularMoviesUsecase.call(NoParams());

    response.fold(
      (l) => emit(PopularMoviesError(l.errorMessage)),
      (r) => emit(PopularMoviesLoaded(r)),
    );
  }
}
