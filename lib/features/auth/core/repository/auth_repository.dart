import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/services/storage_service.dart';
import '../entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Future<Either<AppError, void>> signUp({
    required String phone,
  });
  Future<Either<AppError, void>> signIn({
    required String phone,
  });
  Future<Either<AppError, UserEntity>> checkCode({
    required String phone,
    required String code,
  });
  Future<Either<AppError, bool>> checkActiveSession();
  Future<Either<AppError, UserEntity>> getCurrentUser();
  Future<Either<AppError, UserEntity>> editCurrentUser(UserEntity entity);
  Future<Either<AppError, void>> logOut();
  Future<Either<AppError, void>> deleteAccount();
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<Either<AppError, void>> signUp({required String phone}) async {
    try {
      await remoteDataSource.signUp(
        phone: phone,
      );

      return Right(Future.value(null));
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, void>> signIn({required String phone}) async {
    try {
      await remoteDataSource.signIn(
        phone: phone,
      );

      return Right(Future.value(null));
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, UserEntity>> checkCode(
      {required String phone, required String code}) async {
    try {
      final response = await remoteDataSource.checkCode(
        phone: phone,
        code: code,
      );

      await localDataSource.saveToken(response.token);

      debugPrint("Response user ${response.user}");
      debugPrint("Response token ${response.token}");

      return Right(response.user);
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, bool>> checkActiveSession() async {
    try {
      final StorageService service = StorageService();

      final tokenFromStorage = await service.get(key: 'deviceMessagingToken');

      log("TOken from storage $tokenFromStorage");

      final response = await localDataSource.checkActiveSession();

      return Right(response);
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, void>> logOut() async {
    await localDataSource.logOut();
    return const Right(null);
  }

  @override
  Future<Either<AppError, UserEntity>> getCurrentUser() async {
    return action(
      task: remoteDataSource.getCurrentUser(),
    );
  }

  @override
  Future<Either<AppError, void>> deleteAccount() async {
    await localDataSource.logOut();
    return action(
      task: remoteDataSource.deleteAccount(),
    );
  }

  @override
  Future<Either<AppError, UserEntity>> editCurrentUser(
      UserEntity entity) async {
    return action<UserEntity>(
      task: remoteDataSource.editCurrentUser(UserModel.fromEntity(entity)),
    );
  }
}
