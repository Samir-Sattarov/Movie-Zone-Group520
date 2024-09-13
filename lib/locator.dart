import 'package:get_it/get_it.dart';

import 'app_core/api/firebase_auth_client.dart';
import 'app_core/services/storage_service.dart';

final locator = GetIt.I;

void setup() {
  // ================ BLoC / Cubit ================ //

  // ================ UseCases ================ //

  // ================ Repository / Datasource ================ //

  // ================ Core ================ //

  // ================ External ================ //

  locator.registerLazySingleton<FirebaseAuthClient>(
      () => FirebaseAuthClientImpl(storageService: locator()));

  locator.registerLazySingleton(() => StorageService());
}
