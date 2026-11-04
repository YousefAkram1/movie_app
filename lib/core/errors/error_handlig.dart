import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'model/error_model.dart';

class ErrorHandling {
  static ErrorModel handle(dynamic e) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return ErrorModel(message: "Connection Time Out", statusCode: 430);
      }

      if (e.type == DioExceptionType.sendTimeout) {
        return ErrorModel(message: "Send Time Out", statusCode: 431);
      }

      if (e.type == DioExceptionType.receiveTimeout) {
        return ErrorModel(message: "Receive Time Out", statusCode: 432);
      }

      if (e.type == DioExceptionType.badCertificate) {
        return ErrorModel(message: "Bad Certificate", statusCode: 433);
      }

      if (e.type == DioExceptionType.badResponse) {
        return ErrorModel(
          message: "Bad Response",
          statusCode: e.response?.statusCode ?? 400,
        );
      }

      if (e.type == DioExceptionType.cancel) {
        return ErrorModel(message: "Request Cancelled", statusCode: 434);
      }

      if (e.type == DioExceptionType.connectionError) {
        return ErrorModel(message: "Connection Error", statusCode: 435);
      }

      if (e.type == DioExceptionType.unknown) {
        return ErrorModel(message: "Unknown Error", statusCode: 436);
      }
    } else if (e is FirebaseAuthException) {
      log('Message ${e.code}');

      if (e.code == 'weak-password') {
        return ErrorModel(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ErrorModel(
          message: 'The account already exists for that email.',
        );
      } else if (e.message ==
          'The supplied auth credential is incorrect, malformed or has expired.') {
        return ErrorModel(message: 'No user found for that email.');
      } else if (e.message == 'wrong-password') {
        return ErrorModel(message: 'Wrong password provided for that user.');
      } else if (e.message == 'The email address is badly formatted.') {
        return ErrorModel(message: 'The email address is badly formatted.');
      }
    } else if (e is Exception) {
      return ErrorModel(message: e.toString(), statusCode: 440);
    }

    return ErrorModel(message: "Unexpected Error", statusCode: 450);
  }
}
