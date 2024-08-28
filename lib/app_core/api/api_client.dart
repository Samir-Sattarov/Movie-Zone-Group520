import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/auth/core/datasources/auth_local_data_source.dart';
import 'api_constants.dart';
import 'api_exceptions.dart';

abstract class ApiClient {
  Future<dynamic> get(String path,
      {bool withParse = true,
      Map<String, dynamic>? params,
      Map<dynamic, dynamic>? filter});
  Future<dynamic> post(String path,
      {required Map<String, dynamic> params, bool withToken = false});
  Future<dynamic> patch(String path, {required Map<String, dynamic> params});
  Future<dynamic> put(String path, {required Map<String, dynamic> params});
  Future<dynamic> download({required String fileUrl});
  Future<dynamic> deleteWithBody(String path,
      {Map<String, dynamic>? params, bool withParse = false});
}

class ApiClientImpl extends ApiClient {
  final AuthLocalDataSource _authenticationLocalDataSource;
  final Dio clientDio;

  ApiClientImpl(this.clientDio, this._authenticationLocalDataSource);

  @override
  Future<dynamic> download({required String fileUrl}) async {
    String sessionId = await _authenticationLocalDataSource.getToken() ?? "";
    clientDio.interceptors
        .removeWhere((interceptor) => interceptor is DioCacheInterceptor);
    final header = {'Authorization': "Bearer $sessionId"};
    final Directory dir = await getApplicationDocumentsDirectory();

    try {
      await clientDio.download(fileUrl, dir.path,
          options: Options(headers: header));
    } catch (e) {
      throw Exception("Error downloading file: $e");
    }
  }

  @override
  Future<dynamic> get(String path,
      {bool withParse = true,
      Map<dynamic, dynamic>? filter,
      Map<String, dynamic>? params}) async {
    String sessionId = await _authenticationLocalDataSource.getToken() ?? "";
    final Map<String, dynamic> header =
        sessionId.isNotEmpty ? {'Authorization': "Bearer $sessionId"} : {};
    final pth = _buildUrl(path, params);

    final response = await _tryCatch(() => clientDio.get(pth,
        options: Options(contentType: "application/json", headers: header)));
    return _errorHandler(response, withParse: withParse);
  }

  @override
  Future<dynamic> patch(String path,
      {required Map<dynamic, dynamic> params}) async {
    String sessionId = await _authenticationLocalDataSource.getToken() ?? "";
    final header = {
      'Accept': 'application/json',
      if (sessionId.isNotEmpty) 'Authorization': "Bearer $sessionId"
    };

    final response = await _tryCatch(() => clientDio.patch(_buildUrl(path),
        data: jsonEncode(params), options: Options(headers: header)));
    return _errorHandler(response);
  }

  @override
  Future put(String path, {required Map<String, dynamic> params}) async {
    String sessionId = await _authenticationLocalDataSource.getToken() ?? "";
    final header = {
      'Accept': 'application/json',
      if (sessionId.isNotEmpty) 'Authorization': "Bearer $sessionId"
    };

    final response = await _tryCatch(() => clientDio.put(_buildUrl(path),
        data: jsonEncode(params), options: Options(headers: header)));
    return _errorHandler(response);
  }

  @override
  Future<dynamic> deleteWithBody(String path,
      {Map<String, dynamic>? params, bool withParse = true}) async {
    String sessionId = await _authenticationLocalDataSource.getToken() ?? "";
    final header = {'Authorization': "Bearer $sessionId"};

    final response = await _tryCatch(() => clientDio.delete(_buildUrl(path),
        data: jsonEncode(params), options: Options(headers: header)));
    return _errorHandler(response, withParse: withParse);
  }

  @override
  Future<dynamic> post(String path,
      {required Map<String, dynamic> params, bool withToken = false}) async {
    String sessionId = await _authenticationLocalDataSource.getToken() ?? "";
    final header = {
      "Content-type": "application/json",
      "Accept": "*/*",
      if (sessionId.isNotEmpty) 'Authorization': "Bearer $sessionId"
    };

    final response = await _tryCatch(() => clientDio.post(_buildUrl(path),
        data: jsonEncode(params), options: Options(headers: header)));
    return _errorHandler(response);
  }

  Future<Response> _tryCatch(Future<Response> Function() function) async {
    try {
      try {
        final Response response = await function();

        return response;
      } on DioException catch (error) {
        print("ERROR CATCH $error");

        throw   ExceptionWithMessage('Unknown error occurred ${error.toString()}');
      }
    } on DioException catch (e) {
      final response = e.response;
      if (response == null) {
        throw const ExceptionWithMessage('Unknown error occurred');
      }

      _handleError(response);
      throw const ExceptionWithMessage('Unhandled error occurred');
    } catch (error) {
      throw const ExceptionWithMessage('Unknown error occurred');
    }
  }

  void _handleError(Response response) {
    String msg = "unknown_error";
    if (response.statusCode != null) {
      if (response.statusCode! >= 500) {
        throw const ExceptionWithMessage("Server is down (500)");
      }

      var responseData =
          response.data is String ? jsonDecode(response.data) : response.data;

      if (responseData is Map<String, dynamic>) {
        msg = responseData["error"] ?? responseData["message"] ?? msg;
        if (responseData["message"] is List &&
            responseData["message"].isNotEmpty) {
          msg = responseData["message"][0];
        }
      }
    }

    print("response.statusCode ${response.statusCode}");

    switch (response.statusCode) {
      case 400:
      case 403:
      case 405:
      case 409:
        throw ExceptionWithMessage(msg);
      case 401:
        throw UnauthorisedException();

      default:
        throw Exception(response.statusMessage);
    }
  }

  dynamic _errorHandler(Response response, {bool withParse = true}) {
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
      return withParse
          ? Map<String, dynamic>.from(response.data)
          : response.data;
    }
    _handleError(response);
  }

  String _buildUrl(String path, [Map<dynamic, dynamic>? params]) {
    if (params == null || params.isEmpty) {
      return '${ApiConstants.baseApiUrl}$path';
    }
    final paramsString =
        params.entries.map((e) => '${e.key}=${e.value}').join('&');
    return '${ApiConstants.baseApiUrl}$path?$paramsString';
  }
}
