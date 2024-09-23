// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../../../../app_core/api/firebase_api_client.dart';
import '../../../../app_core/api/firebase_auth_client.dart';
import '../../../../app_core/api/firebase_collections.dart';
import '../../../../app_core/app_core_library.dart';
import '../../../auth/core/models/user_model.dart';
import '../models/movie_results_model.dart';

abstract class MainRemoteDataSource {
  Future<UserModel> getCurrentUser();
  Future<MovieResultsModel> getMovieList();
  Future<MovieResultsModel> getPopularMoviesList();
  Future<MovieResultsModel> getTopRatedMoviesList();
  Future<void> editCurrentUser(UserModel model);
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient apiClient;
  final FirebaseApiClient firestoreClient;
  final FirebaseAuthClient client;

  MainRemoteDataSourceImpl(this.client, this.firestoreClient, this.apiClient);

  @override
  Future<UserModel> getCurrentUser() async => await client.getCurrentUser();

  @override
  Future<void> editCurrentUser(UserModel model) async {
    await firestoreClient.put(FirebaseCollections.users,
        params: model.toJson());
  }

  @override
  Future<MovieResultsModel> getMovieList() async {
    // ?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc
    final response = await apiClient.get(ApiConstants.movies, params: {
      "page": 1,
      // "include_video": "false",
      // "include_adult": "false",
      // "language": "en-US",
      // "sort_by": "popularity.desc",
    });

    final model = MovieResultsModel.fromJson(response);

    return model;
  }

  @override
  Future<MovieResultsModel> getPopularMoviesList() async {
    final response = await apiClient.get(ApiConstants.popularMovies, params: {
      "page": 1,
    });

    final model = MovieResultsModel.fromJson(response);

    return model;
  }

  @override
  Future<MovieResultsModel> getTopRatedMoviesList()async  {
    final response = await apiClient.get(ApiConstants.topRatedMovies, params: {
      "page": 1,
    });

    final model = MovieResultsModel.fromJson(response);

    return model;
  }
}
