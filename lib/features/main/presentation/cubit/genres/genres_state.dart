part of 'genres_cubit.dart';

@immutable
sealed class GenresState {}

final class GenresInitial extends GenresState {}
final class GenresLoading extends GenresState {}
final class GenresError extends GenresState {
  final String message;

  GenresError(this.message);
}
final class GenresLoaded extends GenresState {
  final GenreResultsEntity results;

  GenresLoaded(this.results);
}
