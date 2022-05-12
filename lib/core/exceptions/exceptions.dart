// ignore_for_file: avoid_dynamic_calls

import 'dart:io';
import 'package:dio/dio.dart';

class CustomException implements Exception {
  final CustomError error;

  CustomException._(this.error);

  @override
  String toString() => "message : $error";
}

class ExceptionHandler {
  factory ExceptionHandler(dynamic error) {
    switch (error.runtimeType) {
      case FormatException:
        throw CustomException._(CustomError.formatException);
      case DioError:
        if (error.type == DioErrorType.connectTimeout ||
            error.type == DioErrorType.receiveTimeout ||
            error.type == DioErrorType.sendTimeout ||
            error.type == DioErrorType.cancel ||
            (error.message != null &&
                error.message.contains("SocketException"))) {
          throw CustomException._(CustomError.noInternet);
        } else {
          throw CustomException._(CustomError.unKnown);
        }
      case SocketException:
        throw CustomException._(CustomError.noInternet);
      case HttpException:
        throw CustomException._(CustomError.noInternet);
      default:
        throw CustomException._(CustomError.unKnown);
    }
  }
}

enum CustomError {
  noInternet,
  unKnown,
  notFound,
  formatException,
  badRequest,
}
