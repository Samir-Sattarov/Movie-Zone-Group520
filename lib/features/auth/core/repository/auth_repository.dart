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
  Future<Either<AppError, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<AppError, UserEntity>> signIn({
    required String email,
    required String password,
  });
  Future<Either<AppError, UserEntity>> getCurrentUser();
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<Either<AppError, UserEntity>> getCurrentUser() async {
    return action(task: remoteDataSource.getCurrentUser());
  }

  @override
  Future<Either<AppError, UserEntity>> signIn({
    required String email,
    required String password,
  }) async {
    return action(
      task: remoteDataSource.signIn(email: email, password: password),
    );
  }

  @override
  Future<Either<AppError, UserEntity>> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    return action(
      task: remoteDataSource.signUp(
        email: email,
        password: password,
        name: name,
      ),
    );
  }
}
