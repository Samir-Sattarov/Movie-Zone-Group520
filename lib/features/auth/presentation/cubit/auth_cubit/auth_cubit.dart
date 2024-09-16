import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app_core/app_core_library.dart';
import '../../../../../app_core/services/storage_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final StorageService service;
  AuthCubit(this.service) : super(AuthLoading());

  check() async {
    final data = await service.get(key: StorageKeys.kUserId);
    print("DATA $data");
    final condition = data != null;

    if (condition) {
      emit(AuthSuccess());
    } else {
      emit(AuthNotSuccess());
    }
  }

  logOut() async {
    await service.deleteAll();
    emit(AuthNotSuccess());
  }
}
