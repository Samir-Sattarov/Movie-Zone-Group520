import 'package:dartz/dartz.dart';

import '../../../../app_core/app_core_library.dart';
import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

// ================ USE CASSES ================ //

class SignUpUsecase extends UseCase<void, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUsecase(this.authRepository);

  @override
  Future<Either<AppError, void>> call(SignUpParams params) =>
      authRepository.signUp(
        phone: params.phone,
      );
}
class SignInUsecase extends UseCase<void, SignInUsecaseParams> {
  final AuthRepository authRepository;

  SignInUsecase(this.authRepository);

  @override
  Future<Either<AppError, void>> call(SignInUsecaseParams params)async  {
    final response =  await authRepository.signIn(
        phone: params.phone,
      );

    print("RESPONSE SIGN IN $response");

return    response;
  }
}

class VerifyOtpUsecase extends UseCase<UserEntity, VerifyOtpUsecaseParams> {
  final AuthRepository authRepository;

  VerifyOtpUsecase(this.authRepository);

  @override
  Future<Either<AppError, UserEntity>> call(VerifyOtpUsecaseParams params) =>
      authRepository.checkCode(
        phone: params.phone,
        code: params.code,
      );
}

class LogOutUsecase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogOutUsecase(this.authRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) =>
      authRepository.logOut();
}

class DeleteAccountUsecase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  DeleteAccountUsecase(this.authRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) =>
      authRepository.deleteAccount();
}

// ================ PARAMS ================ //

class SignUpParams {
  final String phone;

  SignUpParams({
    required this.phone,
  });
}
class SignInUsecaseParams {
  final String phone;

  SignInUsecaseParams({
    required this.phone,
  });
}

class VerifyOtpUsecaseParams {
  final String phone;
  final String code;

  VerifyOtpUsecaseParams({
    required this.phone,
    required this.code,
  });
}
