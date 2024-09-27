import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'api_exceptions.dart';

enum FirebaseApiFilterType {
  isEqualTo,
  isNotEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  arrayContains,
  arrayContainsAny,
  whereIn,
  whereNotIn,
  isNull,
}

class FirebaseFilterEntity {
  final String field;
  final FirebaseApiFilterType operator;
  final dynamic value;

  FirebaseFilterEntity({
    required this.field,
    required this.operator,
    required this.value,
  });
}

abstract class FirebaseApiClient {
  Future<dynamic> get(String collection,
      {int limit = 20, List<FirebaseFilterEntity>? filters});
  Future<dynamic> getById(String collection, String id);
  Future<dynamic> postWithId(String collection,
      {required Map<String, dynamic> params});
  Future<void> post(String collection,
      {required String id, required Map<String, dynamic> params});
  Future<void> putWithId(String collection,
      {required String id, required Map<String, dynamic> params});
  Future<void> put(String collection, {required Map<String, dynamic> params});
  Future<void> deleteDoc(String collection, String id);
}

class FirebaseApiClientImpl extends FirebaseApiClient {
  final FirebaseFirestore _client;

  FirebaseApiClientImpl(this._client);

  @override
  Future<dynamic> get(String collection,
      {int limit = 20, List<FirebaseFilterEntity>? filters}) async {
    try {
      Query query = _client.collection(collection);

      if (filters != null) {
        for (var filter in filters) {
          switch (filter.operator) {
            case FirebaseApiFilterType.isEqualTo:
              query = query.where(filter.field, isEqualTo: filter.value);
              break;
            case FirebaseApiFilterType.isNotEqualTo:
              query = query.where(filter.field, isNotEqualTo: filter.value);
              break;
            case FirebaseApiFilterType.isGreaterThan:
              query = query.where(filter.field, isGreaterThan: filter.value);
              break;
            case FirebaseApiFilterType.isGreaterThanOrEqualTo:
              query = query.where(filter.field,
                  isGreaterThanOrEqualTo: filter.value);
              break;
            case FirebaseApiFilterType.isLessThan:
              query = query.where(filter.field, isLessThan: filter.value);
              break;
            case FirebaseApiFilterType.isLessThanOrEqualTo:
              query =
                  query.where(filter.field, isLessThanOrEqualTo: filter.value);
              break;
            case FirebaseApiFilterType.arrayContains:
              query = query.where(filter.field, arrayContains: filter.value);
              break;
            case FirebaseApiFilterType.arrayContainsAny:
              query = query.where(filter.field, arrayContainsAny: filter.value);
              break;
            case FirebaseApiFilterType.whereIn:
              query = query.where(filter.field, whereIn: filter.value);
              break;
            case FirebaseApiFilterType.whereNotIn:
              query = query.where(filter.field, whereNotIn: filter.value);
              break;
            case FirebaseApiFilterType.isNull:
              query = query.where(filter.field, isNull: filter.value);
              break;
            default:
              throw ArgumentError('Unsupported operator: ${filter.operator}');
          }
        }
      }

      final response = await query.limit(limit).get();
      return response.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw _handleError(e, tr('errorGettingDataCollection'));
    }
  }

  @override
  Future<dynamic> getById(String collection, String id) async {
    try {
      final response = await _client.collection(collection).doc(id).get();
      if (!response.exists) {
        throw Exception(
            'Document with ID $id not found in collection $collection');
      }
      return response.data();
    } catch (e) {
      throw _handleError(e, tr('errorGettingDocumentById'));
    }
  }

  @override
  Future<void> put(String collection,
      {required Map<String, dynamic> params}) async {
    if (!params.containsKey('id')) {
      throw ArgumentError(tr('documentIdIsRequiredToUpdate'));
    }
    try {

      print("PARAMS $params");

      await _client.collection(collection).doc(params['id']).update(params);
    } catch (e) {
      throw _handleError(e, tr('errorUpdatingDocument'));
    }
  }

  @override
  Future<void> deleteDoc(String collection, String id) async {
    try {
      await _client.collection(collection).doc(id).delete();
    } catch (e) {
      throw _handleError(e, tr('errorDeletingDocument'));
    }
  }

  Exception _handleError(dynamic error, String defaultMessage) {
    if (error is FirebaseException) {
      switch (error.code) {
        case 'permission-denied':
          return UnauthorisedException();
        case 'not-found':
          return Exception(defaultMessage);
        default:
          return ExceptionWithMessage('$defaultMessage: ${error.message}');
      }
    }
    return Exception(defaultMessage);
  }

  @override
  Future<void> post(String collection,
      {required String id, required Map<String, dynamic> params}) async {
    try {
      await _client.collection(collection).doc(id).set(params);
    } catch (e) {
      throw _handleError(e, tr('errorPostingDataCollection'));
    }
  }

  @override
  Future<dynamic> postWithId(String collection,
      {required Map<String, dynamic> params}) async {
    try {
      debugPrint("Post data $collection\n$params");
      await _client.collection(collection).doc(params['id']).set(params);
      return params;
    } catch (e) {
      throw _handleError(e, tr('errorPostingDataCollection'));
    }
  }

  @override
  Future<void> putWithId(String collection,
      {required String id, required Map<String, dynamic> params}) async {
    try {

      await _client.collection(collection).doc(id).update(params);
    } catch (e) {
      throw _handleError(e, tr('errorUpdatingDocument'));
    }
  }
}
