// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../../../../app_core/api/firebase_api_client.dart';
import '../../../../app_core/api/firebase_auth_client.dart';
import '../../../../app_core/api/firebase_collections.dart';
import '../../../../app_core/app_core_library.dart';
import '../../../auth/core/models/user_model.dart';

abstract class MainRemoteDataSource {
  Future<UserModel> getCurrentUser();
  Future<void> editCurrentUser(UserModel model);
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final FirebaseApiClient apiClient;
  final FirebaseAuthClient client;

  MainRemoteDataSourceImpl(this.client, this.apiClient);

  @override
  Future<UserModel> getCurrentUser() async => await client.getCurrentUser();

  @override
  Future<void> editCurrentUser(UserModel model) async {
    await apiClient.put(FirebaseCollections.users, params: model.toJson());
  }
}
