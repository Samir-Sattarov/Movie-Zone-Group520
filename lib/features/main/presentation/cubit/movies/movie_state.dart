part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}
final class MovieLoading extends MovieState {}
final class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
final class MovieLoaded extends MovieState {
  final MovieResultsEntity entity;

  MovieLoaded(this.entity);
}
