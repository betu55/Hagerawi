import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/main.dart';
import 'package:hagerawi_app/pages/events.dart';
import 'package:hagerawi_app/pages/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/feed/screens/feeds.dart';

const kPrimaryColor = Color(0xff777777);
const kPrimaryLightColor = Colors.white;

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  static const String routeName = "/login";

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade900,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            //main background
            Container(
              color: Colors.grey.shade800,
            ),
            Column(
              children: [
                //this is the gradient container contents
                Container(
                  height: size.height / 1.3,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.grey.shade600,
                        Colors.blueGrey.shade800,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          "Log-in",
                          style: TextStyle(
                            color: Colors.grey.shade200.withAlpha(120),
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: InputFieldAuth("username", 0),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: InputFieldAuth("password", 2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        height: 45,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: BlocConsumer<AuthBloc, AuthState>(
                            listener: (ctx, authState) {
                          if (authState is LoggedIn) {
                            Navigator.of(context).pushNamed(Feeds.routeName);
                          }
                        }, builder: (ctx, authState) {
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
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
                              ),
                              onPressed: () {
                                final authBloc =
                                    BlocProvider.of<AuthBloc>(context);

                                authBloc.add(
                                  LoginEvent(
                                    email: emailTextController.text,
                                    password: passwordTextController.text,
                                  ),
                                );
                              },
                              child: buttonChild);
                        }),
                      ),
                    ],
                  ),
                ),
                //this is the bottom link
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? | ",
                        style: TextStyle(
                          color: Colors.grey.shade200.withAlpha(120),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Signup();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Sign-up",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
