import 'package:get_it/get_it.dart';

import 'app_core/api/firebase_auth_client.dart';
import 'app_core/app_core_library.dart';
import 'app_core/services/storage_service.dart';
import 'features/auth/core/datasources/auth_local_data_source.dart';
import 'features/auth/core/datasources/auth_remote_data_source.dart';
import 'features/auth/core/repository/auth_repository.dart';
import 'features/auth/core/usecases/auth_usecases.dart';
import 'features/auth/core/usecases/user_usecases.dart';
import 'features/auth/presentation/cubit/sign_in/sign_in_cubit.dart';
import 'features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';

final locator = GetIt.I;

void setup() {
  // ================ BLoC / Cubit ================ //

  locator.registerFactory(() => SignUpCubit(locator()));
  locator.registerFactory(() => SignInCubit(locator()));

  // ================ UseCases ================ //

  locator.registerLazySingleton(() => SignInUsecase(locator()));
  locator.registerLazySingleton(() => SignUpUsecase(locator()));
  locator.registerLazySingleton(() => GetCurrentUserUsecase(locator()));

  // ================ Repository / Datasource ================ //
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        locator(),
        locator(),
      ));

  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(locator()),
  );

  // ================ Core ================ //

  // ================ External ================ //

  locator.registerLazySingleton<FirebaseAuthClient>(
      () => FirebaseAuthClientImpl(storageService: locator()));

  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => SecureStorage());
}
