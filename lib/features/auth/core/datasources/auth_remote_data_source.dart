// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../../../../app_core/app_core_library.dart';
import '../entities/user_entity.dart';
import '../models/token_response_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<void> signUp({
    required String phone,
  });
  Future<void> signIn({
    required String phone,
  });

  Future<TokenResponseModel> checkCode({
    required String phone,
    required String code,
  });

  Future<UserModel> getCurrentUser();
  Future<void> deleteAccount();
  Future<UserModel> editCurrentUser(UserModel model);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<void> signUp({
    required String phone,
  }) async {
    final params = {
      "phone_number": phone,
    };
    await client.post(
      ApiConstants.signIn,
      params: params,
    );
  }

  @override
  Future<void> signIn({required String phone}) async {
    await client.post(
      ApiConstants.signIn,
      params: {
        "phone_number": phone,
      },
    );
  }

  @override
  Future<TokenResponseModel> checkCode({
    required String phone,
    required String code,
  }) async {
    final params = {
      "phone_number": phone,
      "otp": code,
    };
    final response = await client.post(ApiConstants.checkCode, params: params);

    debugPrint("Response $response");

    final model = TokenResponseModel.fromJson(response);

    return model;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await client.get(ApiConstants.currentUser);

    debugPrint("response $response");
    final model = UserModel.fromJson(
      response['user'],
    );

    return model;
  }

  @override
  Future<void> deleteAccount() async {
    await client.deleteWithBody(ApiConstants.userEdit);
  }

  @override
  Future<UserModel> editCurrentUser(UserModel model) async {
    final response =
        await client.put(ApiConstants.currentUserEdit, params: model.toJson());
    debugPrint("response $response");

    final data = UserModel.fromJson(
      response['user'],
    );

    return data;
  }
}
