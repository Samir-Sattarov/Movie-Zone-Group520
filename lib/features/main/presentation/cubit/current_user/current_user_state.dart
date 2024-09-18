part of 'current_user_cubit.dart';

@immutable
sealed class CurrentUserState {}

final class CurrentUserInitial extends CurrentUserState {}

final class CurrentUserLoading extends CurrentUserState {}

final class CurrentUserError extends CurrentUserState {
  final String message;

  CurrentUserError(this.message);
}

final class CurrentUserLoaded extends CurrentUserState {}
