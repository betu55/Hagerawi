import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/auth/models/auth_model.dart';
import 'package:hagerawi_app/auth/repository/auth_repo.dart';
import 'package:hagerawi_app/auth/screens/signup.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authoRepo;
  AuthBloc(this.authoRepo) : super(LoggedOut());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
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
        print(user.username);
        print(user.password);
        yield LoggedIn(user.username, user.password);
      } catch (_) {
        yield AuthFailed(
            errorMsg:
                "Sorry server side error occured, you have nothing to do with it ;).");
      }
    }

    if (event is SignupEvent) {
      final username = event.props[0].toString();
      final password = event.props[1].toString();

      yield SignupInProgress();
      await Future.delayed(Duration(seconds: 1));

      try {
        AuthModel user = await authoRepo.register(username, password);
        yield SignupSucess(user.username, user.password);
      } catch (_) {
        yield AuthFailed(
            errorMsg:
                "Sorry server side error occured, you have nothing to do with it ;).");
      }
    }
  }
}
