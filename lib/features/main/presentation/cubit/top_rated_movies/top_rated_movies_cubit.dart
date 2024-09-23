import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app_core/entities/no_params.dart';
import '../../../core/entities/movie_results_entity.dart';
import '../../../core/usecases/movie_usecases.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  TopRatedMoviesCubit(this.getTopRatedMoviesUsecase)
      : super(TopRatedMoviesInitial());
  load() async {
    emit(TopRatedMoviesLoading());

    final response = await getTopRatedMoviesUsecase.call(NoParams());

    response.fold(
      (l) => emit(TopRatedMoviesError(l.errorMessage)),
      (r) => emit(TopRatedMoviesLoaded(r)),
    );
  }
}
