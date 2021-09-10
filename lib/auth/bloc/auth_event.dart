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
