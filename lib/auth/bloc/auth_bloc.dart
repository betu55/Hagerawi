import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/auth/models/auth_model.dart';
import 'package:hagerawi_app/auth/repository/auth_repo.dart';

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
        print("from bloc");
        try {
          yield LoggedIn(user.username, user.password);
        } catch (e) {
          print(e);
        }
      } catch (err) {
        yield AuthFailed(errorMsg: err.toString());
      }
    }
  }
}
