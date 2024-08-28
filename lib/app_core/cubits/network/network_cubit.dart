import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../services/network_connection_checker.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkInfo networkService;

  NetworkCubit( this.networkService) : super(NetworkInitial()) {
    listenConnection();
  }

  static bool _isOnline = false;

  bool get isOnline => _isOnline;

  listenConnection()   {
    networkService.connectionStream.listen((status) {

      debugPrint("Connection status $status");

      if(status == InternetConnectionStatus.connected) {
        _isOnline = true;
        emit(NetworkConnectedState());
      }else {
        _isOnline = false;
        emit(NetworkLostState());
      }
    });
  }
}
