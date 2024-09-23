part of 'search_movies_cubit.dart';

@immutable
sealed class SearchMoviesState {}

final class SearchMoviesInitial extends SearchMoviesState {}
final class SearchMoviesLoading extends SearchMoviesState {}
final class SearchMoviesError extends SearchMoviesState {
  final String message;

  SearchMoviesError(this.message);
}
final class SearchMoviesLoaded extends SearchMoviesState {
  final MovieResultsEntity results;

  SearchMoviesLoaded(this.results);
}
