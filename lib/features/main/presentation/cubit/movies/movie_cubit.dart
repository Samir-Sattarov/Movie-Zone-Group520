import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../app_core/app_core_library.dart';
import '../../../core/entities/movie_results_entity.dart';
import '../../../core/usecases/movie_usecases.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUsecase getMoviesUsecase;
  MovieCubit(this.getMoviesUsecase) : super(MovieInitial());

  load() async {
    emit(MovieLoading());

    final response = await getMoviesUsecase.call(NoParams());

    response.fold(
      (l) => emit(MovieError(l.errorMessage)),
      (r) => emit(MovieLoaded(r)),
    );
  }
}
