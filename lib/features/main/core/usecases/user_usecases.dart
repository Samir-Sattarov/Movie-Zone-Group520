import 'package:dartz/dartz.dart';
import '../../../../app_core/app_core_library.dart';
import '../../../auth/core/entities/user_entity.dart';
import '../repository/main_repository.dart';

class GetCurrentUserUsecase extends UseCase<UserEntity, NoParams> {
  final MainRepository mainRepository;

  GetCurrentUserUsecase(this.mainRepository);

  @override
  Future<Either<AppError, UserEntity>> call(NoParams params) =>
      mainRepository.getCurrentUser();
}

class EditCurrentUserUsecase
    extends UseCase<void, EditCurrentUserUsecaseParams> {
  final MainRepository mainRepository;

  EditCurrentUserUsecase(this.mainRepository);

  @override
  Future<Either<AppError, void>> call(EditCurrentUserUsecaseParams params) =>
      mainRepository.editCurrentUser(params.entity);
}

class EditCurrentUserUsecaseParams {
  final UserEntity entity;

  EditCurrentUserUsecaseParams(this.entity);
}
