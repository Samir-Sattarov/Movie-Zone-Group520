// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../../../../app_core/api/firebase_auth_client.dart';
import '../../../../app_core/app_core_library.dart';
import '../entities/user_entity.dart';
import '../models/token_response_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp({
    required String email,
    required String name,
    required String password,
  });
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  Future<UserModel> getCurrentUser();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuthClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<UserModel> getCurrentUser() async => await client.getCurrentUser();

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    final response = await client.signIn(email: email, password: password);

    return response;
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    final response = await client.signUp(
      email: email,
      password: password,
      name: name,
    );

    return response;
  }
}
