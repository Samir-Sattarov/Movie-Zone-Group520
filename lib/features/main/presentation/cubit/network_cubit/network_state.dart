part of 'network_cubit.dart';

@immutable
sealed class NetworkState {}

final class NetworkConnected extends NetworkState {}
final class NetworkNoConnected extends NetworkState {}
