part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthNotSuccess extends AuthState {}
