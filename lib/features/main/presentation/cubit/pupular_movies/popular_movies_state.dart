part of 'popular_movies_cubit.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}
final class PopularMoviesLoading extends PopularMoviesState {}
final class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError(this.message);
}
final class PopularMoviesLoaded extends PopularMoviesState {
  final MovieResultsEntity results;

  PopularMoviesLoaded(this.results);
}
