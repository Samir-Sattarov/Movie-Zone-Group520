import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/core/models/user_model.dart';
import '../../features/main/core/models/movie_model.dart';
import '../app_core_library.dart';
import '../services/storage_service.dart';
import 'api_exceptions.dart';
import 'firebase_collections.dart';

abstract class FirebaseAuthClient {
  Future<dynamic> signIn({required String email, required String password});
  Future<dynamic> signUp({required String email, required String password});
  Future<UserModel> getCurrentUser();
}

class FirebaseAuthClientImpl extends FirebaseAuthClient {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final StorageService storageService;

  FirebaseAuthClientImpl({required this.storageService});

  @override
  Future signIn({required String email, required String password}) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final id = credential.user!.uid;

      final response =
          await firestore.collection(FirebaseCollections.users).doc(id).get();

      if (response.data() == null) {
        throw const ExceptionWithMessage("User not found in database!");
      }
      await storageService.save(key: StorageKeys.kUserId, value: id);

      final model = UserModel.fromJson(response.data()!);

      log(credential.user.toString());
      log(credential.toString());

      log(model.toJson().toString());
      return model;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future signUp({required String email, required String password}) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final id = credential.user!.uid;
      final user = UserModel(
        id: id,
        name: "",
        surname: "",
        email: email,
        favoriteMovies: const <MovieModel>[],
      );

      await firestore
          .collection(FirebaseCollections.users)
          .doc(id)
          .set(user.toJson());

      await storageService.save(key: StorageKeys.kUserId, value: id);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final id = await storageService.get(key: StorageKeys.kUserId);

      final response =
          await firestore.collection(FirebaseCollections.users).doc(id).get();

      if (response.data() == null) {
        throw const ExceptionWithMessage("User not found in database!");
      }

      final model = UserModel.fromJson(response.data()!);


      log(model.toJson().toString());
      return model;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
