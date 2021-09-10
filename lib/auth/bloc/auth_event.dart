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

class RegisterEvent extends AuthEvent {
  final String _username;
  final String _password;

  RegisterEvent(this._username, this._password);

  @override
  List<Object?> get props => [_username, _password];
}

class PasswordsDontMatch extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class EmptyFields extends AuthEvent {
  @override
  List<Object?> get props => [];
}
