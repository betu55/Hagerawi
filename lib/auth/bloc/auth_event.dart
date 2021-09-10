import 'dart:async';

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class LoginEvent extends AuthEvent {
  final String _username;
  final String _password;

  LoginEvent(this._username, this._password);

  @override
  List<Object?> get props => [_username, _password];
}

class SignupEvent extends AuthEvent {
  final String _username;
  final String _password;
  final String _confirmPassword;

  SignupEvent(this._username, this._password, this._confirmPassword);

  @override
  List<Object?> get props => [_username, _password];
}
