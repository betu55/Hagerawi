import 'package:flutter/foundation.dart';

class AuthModel {
  final username;
  final password;

  AuthModel({this.username, this.password});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      username: json['username'],
      password: json['password'],
    );
  }
}
