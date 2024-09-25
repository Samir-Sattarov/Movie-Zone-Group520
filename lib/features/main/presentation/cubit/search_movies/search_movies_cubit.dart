import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/entities/movie_entity.dart';
import '../../../core/entities/movie_results_entity.dart';
import '../../../core/usecases/movie_usecases.dart';

part 'search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final SearchMoviesUsecase searchMoviesUsecase;
  SearchMoviesCubit(this.searchMoviesUsecase) : super(SearchMoviesInitial());


  static List<MovieEntity> movies =[];
  static int page = 1;

  load(String query) async {
    movies.clear();

    page = 1;
    emit(SearchMoviesLoading());

    final response = await searchMoviesUsecase
        .call(SearchMoviesUsecaseParams(query: query, page: page));

    response.fold(
      (l) => emit(SearchMoviesError(l.errorMessage)),
      (r) {

        movies.addAll(r.data);
        emit(SearchMoviesLoaded(MovieResultsEntity(data: movies)));
      },
    );
  }

  loadMore(String query) async {
    page++;

    final response = await searchMoviesUsecase
        .call(SearchMoviesUsecaseParams(query: query, page: page));

    response.fold(
      (l) => emit(SearchMoviesError(l.errorMessage)),
      (r) {
        movies.addAll(r.data);
        emit(SearchMoviesLoaded(MovieResultsEntity(data: movies)));
      },
    );
  }
}
