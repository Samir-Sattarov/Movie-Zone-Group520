import 'package:dartz/dartz.dart';
import '../../../../app_core/app_core_library.dart';
import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

// ================ USE CASSES ================ //

class GetCurrentUserUsecase extends UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  GetCurrentUserUsecase(this.authRepository);

  @override
  Future<Either<AppError, UserEntity>> call(NoParams params) =>
      authRepository.getCurrentUser();
}
//
// class EditCurrentUserUsecase
//     extends UseCase<UserEntity, EditCurrentUserUsecaseParams> {
//   final AuthRepository authRepository;
//
//   EditCurrentUserUsecase(this.authRepository);
//
//   @override
//   Future<Either<AppError, UserEntity>> call(EditCurrentUserUsecaseParams params) =>
//       authRepository.editCurrentUser(
//         params.entity,
//       );
// }
//
// class EditCurrentUserUsecaseParams {
//   final UserEntity entity;
//
//   EditCurrentUserUsecaseParams(this.entity);
// }
