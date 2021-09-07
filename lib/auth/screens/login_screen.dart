import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/pages/feeds.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/sign-in';

  LoginScreen({Key? key}) : super(key: key);

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inputFieldStyle = InputDecoration(
      border: OutlineInputBorder(),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailTextController,
                decoration: inputFieldStyle.copyWith(
                  hintText: "Email",
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                obscureText: true,
                controller: passwordTextController,
                decoration: inputFieldStyle.copyWith(
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 10.0),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (ctx, authState) {
                  if (authState is LoggedIn) {
                    Navigator.of(context).pushNamed(Feeds.routeName);
                  }
                },
                builder: (ctx, authState) {
                  Widget buttonChild = Text("Login");

                  if (authState is LoginInprogress) {
                    buttonChild = SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  if (authState is AuthFailed) {
                    buttonChild = Text(authState.errorMsg);
                  }

                  return ElevatedButton(
                    onPressed: () {
                      final authBloc = BlocProvider.of<AuthBloc>(context);

                      authBloc.add(
                        LoginEvent(
                          email: emailTextController.text,
                          password: passwordTextController.text,
                        ),
                      );
                    },
                    child: buttonChild,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
