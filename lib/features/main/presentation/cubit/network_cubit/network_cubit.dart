import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

import '../../../../../app_core/services/network_connection_checker.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkInfo networkInfo;
  NetworkCubit(this.networkInfo) : super(NetworkConnected());

  check() {
    networkInfo.connectionStream.listen(
      (state) {
        if (state == (InternetConnectionStatus.connected)) {
          emit(NetworkConnected());
        } else {
          emit(NetworkNoConnected());
        }
      },
    );
  }
}
