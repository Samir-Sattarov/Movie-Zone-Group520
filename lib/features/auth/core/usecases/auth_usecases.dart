import 'package:dartz/dartz.dart';

import '../../../../app_core/app_core_library.dart';
import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

// ================ USE CASSES ================ //

class SignUpUsecase extends UseCase<void, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUsecase(this.authRepository);

  @override
  Future<Either<AppError, void>> call(SignUpParams params) {
    return authRepository.signUp(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class SignInUsecase extends UseCase<void, SignInUsecaseParams> {
  final AuthRepository authRepository;

  SignInUsecase(this.authRepository);

  @override
  Future<Either<AppError, void>> call(SignInUsecaseParams params) async {
    return authRepository.signIn(
        email: params.email, password: params.password);
  }
}
//
//
// class LogOutUsecase extends UseCase<void, NoParams> {
//   final AuthRepository authRepository;
//
//   LogOutUsecase(this.authRepository);
//
//   @override
//   Future<Either<AppError, void>> call(NoParams params) =>
//       authRepository.logOut();
// }

// ================ PARAMS ================ //

class SignUpParams {
  final String email;
  final String password;
  final String name;

  SignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignInUsecaseParams {
  final String email;
  final String password;

  SignInUsecaseParams({
    required this.email,
    required this.password,
  });
}
