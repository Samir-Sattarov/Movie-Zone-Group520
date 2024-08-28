import 'dart:io';

import 'package:dartz/dartz.dart';

import '../api/api_exceptions.dart';
import '../entities/app_error.dart';

Future<Either<AppError, T>> action<T>({required Future<T> task}) async {
  try {
    final response = await task;

    return Right(response);
  } on ExceptionWithMessage catch (e) {

    print("CATCH EXEPTION WITH MESSAGE $e");
    return Left(
      AppError(appErrorType: AppErrorType.msgError, errorMessage: e.message),
    );
  } on SocketException {
    return const Left(AppError(appErrorType: AppErrorType.network));
  } on UnauthorisedException {
    return const Left(AppError(appErrorType: AppErrorType.unauthorised));
  } on Exception  catch (error ){
    print("CATCH EXEPTION  $error");

    return const Left(AppError(appErrorType: AppErrorType.api));
  }
}
