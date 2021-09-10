import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/auth/models/auth_model.dart';
import 'package:hagerawi_app/auth/repository/auth_repo.dart';
import 'package:hagerawi_app/auth/screens/signup.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authoRepo;
  AuthBloc(this.authoRepo) : super(Neutral());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    // this is fired up when  a user tries to login from the UI
    if (event is LoginEvent) {
      final username = event.props[0].toString();
      final password = event.props[1].toString();

      // reaching to the backend
      yield LoginInprogress();

      await Future.delayed(Duration(seconds: 1));

      try {
        // print(username);
        // print(password);
        AuthModel user = await authoRepo.authenticate(username, password);
        print(user);
        try {
          yield LoggedIn(user.username, user.password);
        } catch (e) {
          print(e);
        }
      } catch (err) {
        yield AuthFailed(errorMsg: err.toString());
      }
    }

    // this is fired up when  a user tries to register from the UI
    if (event is RegisterEvent) {
      final username = event.props[0].toString();
      final password = event.props[1].toString();

      // reaching to the backend
      yield RegistrationInProgress();

      await Future.delayed(Duration(seconds: 1));

      try {
        // print(username);
        // print(password);
        AuthModel user = await authoRepo.register(username, password);
        print("the user is $user");
        if (user.username != null && user.password != null) {
          yield Registered(user.username, user.password);
        }
        if (user.username != null && user.password == null) {
          yield UserAlreadyExists();
        }
      } catch (err) {
        yield AuthFailed(errorMsg: err.toString());
      }
    }

    if (event is PasswordsDontMatch) {
      yield PassDontMatchState();
    }

    if (event is EmptyFields) {
      yield EmpFieldState();
    }
  }
}
