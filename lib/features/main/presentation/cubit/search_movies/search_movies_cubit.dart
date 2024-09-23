import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/entities/movie_results_entity.dart';
import '../../../core/usecases/movie_usecases.dart';

part 'search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final SearchMoviesUsecase searchMoviesUsecase;
  SearchMoviesCubit(this.searchMoviesUsecase) : super(SearchMoviesInitial());

  static int page = 1;

  load(String query) async {
    page = 1;
    emit(SearchMoviesLoading());

    final response = await searchMoviesUsecase
        .call(SearchMoviesUsecaseParams(query: query, page: page));

    response.fold(
      (l) => emit(SearchMoviesError(l.errorMessage)),
      (r) => emit(SearchMoviesLoaded(r)),
    );
  }

  loadMore(String query) async {
    page++;
    emit(SearchMoviesLoading());

    final response = await searchMoviesUsecase
        .call(SearchMoviesUsecaseParams(query: query, page: page));

    response.fold(
      (l) => emit(SearchMoviesError(l.errorMessage)),
      (r) => emit(SearchMoviesLoaded(r)),
    );
  }
}
