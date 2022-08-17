import 'dart:core';

class MyException implements Exception {
  final dynamic message;

  MyException(this.message);

  @override
  String toString() {
    if (message == null) return "Exception";
    return "$message";
  }
}
