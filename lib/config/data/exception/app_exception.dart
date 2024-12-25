import 'package:flutter/material.dart';

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._message, this._prefix);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, "No Internet:Connection ");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, "Unauthorized: ");
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, "Timeout: ");
}
