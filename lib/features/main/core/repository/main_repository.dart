import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../app_core/app_core_library.dart';
import '../../../../app_core/services/storage_service.dart';
import '../../../auth/core/entities/user_entity.dart';
import 'package:flutter/material.dart';

import '../../../auth/core/models/user_model.dart';
import '../datasources/main_remote_data_source.dart';
import '../entities/genre_results_entity.dart';
import '../entities/movie_results_entity.dart';

abstract class MainRepository {
  Future<Either<AppError, UserEntity>> getCurrentUser();
  Future<Either<AppError, MovieResultsEntity>> getMovieList();
  Future<Either<AppError, MovieResultsEntity>> getPopularMoviesList();
  Future<Either<AppError, MovieResultsEntity>> getTopRatedMoviesList();
  Future<Either<AppError, MovieResultsEntity>> searchMovies(
      String query, int page);
  Future<Either<AppError, GenreResultsEntity>> getGenresList();
  Future<Either<AppError, void>> editCurrentUser(UserEntity entity);
}

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, UserEntity>> getCurrentUser() async {
    return action(task: remoteDataSource.getCurrentUser());
  }

  @override
  Future<Either<AppError, void>> editCurrentUser(UserEntity entity) async {
    return action(
        task: remoteDataSource.editCurrentUser(UserModel.fromEntity(entity)));
  }

  @override
  Future<Either<AppError, MovieResultsEntity>> getMovieList() async {
    return action(task: remoteDataSource.getMovieList());
  }

  @override
  Future<Either<AppError, MovieResultsEntity>> getPopularMoviesList() async {
    return action(task: remoteDataSource.getPopularMoviesList());
  }

  @override
  Future<Either<AppError, MovieResultsEntity>> getTopRatedMoviesList() async {
    return action(task: remoteDataSource.getTopRatedMoviesList());
  }

  @override
  Future<Either<AppError, GenreResultsEntity>> getGenresList() async {
    return action(task: remoteDataSource.getGenreList());
  }

  @override
  Future<Either<AppError, MovieResultsEntity>> searchMovies(
      String query, int page) async {
    return action(task: remoteDataSource.searchMovies(query, page));
  }
}
