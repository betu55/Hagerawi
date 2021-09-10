abstract class AuthState {}

class LoginInprogress extends AuthState {}

class LoggedIn extends AuthState {
  final String _username;
  final String _password;

  LoggedIn(this._username, this._password);

  String get getUsername => _username;
}

class Registered extends AuthState {
  final String _username;
  final String _password;

  Registered(this._username, this._password);

  String get getUsername => _username;
}

class Neutral extends AuthState {}

class AuthFailed extends AuthState {
  final String errorMsg;

  AuthFailed({required this.errorMsg});

  String get getErrorMsg => errorMsg;
}

class EmpFieldState extends AuthState {}

class PassDontMatchState extends AuthState {}

class UserAlreadyExists extends AuthState {}

class RegistrationInProgress extends AuthState {}
