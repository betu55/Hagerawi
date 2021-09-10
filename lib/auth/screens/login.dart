import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hagerawi_app/auth/repository/auth_repo.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/feed/bloc/feed_bloc.dart';
import 'package:hagerawi_app/feed/repository/feed_repo.dart';
import 'package:hagerawi_app/main.dart';
import 'package:hagerawi_app/pages/events.dart';
import 'package:hagerawi_app/auth/screens/signup.dart';
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

  final authFieldController1 = TextEditingController();
  final authFieldController2 = TextEditingController();

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
      body: BlocProvider(
        create: (context) => AuthBloc(AuthRepo()),
        child: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (ctx, state) {
              final authBloc = BlocProvider.of<AuthBloc>(ctx);

              if (state is LoggedIn) {
                // return Center(
                //   child: Text("Logged in"),
                // );
                SchedulerBinding.instance!.addPostFrameCallback((_) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Feeds();
                  }));
                });
              }
              if (state is LoginInprogress) {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
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
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.blueGrey.shade200,
                        ),
                        SizedBox(height: 14),
                        Text(
                          "logging in...",
                          style: TextStyle(
                              fontSize: 15, color: Colors.blueGrey.shade200),
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  ),
                );
              }
              if (state is AuthFailed) {
                authFieldController1.text = "";
                authFieldController2.text = "";
                return Stack(
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
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Text(
                                  "Sign-in",
                                  style: TextStyle(
                                    color: Colors.grey.shade200.withAlpha(120),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "username", 1, authFieldController1),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "password", 2, authFieldController2),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                width: double.infinity,
                                height: 45,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      authBloc.add(LoginEvent(
                                          authFieldController1.text,
                                          authFieldController2.text));
                                    },
                                    child: Text("Sign-in")),
                              ),
                              SizedBox(height: 10),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: Text(
                                  "username or password doesn't exist!",
                                  style: TextStyle(
                                    color: Colors.red.shade700,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
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
                                  "Sign-in",
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
              return Stack(
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                "Sign-in",
                                style: TextStyle(
                                  color: Colors.grey.shade200.withAlpha(120),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InputFieldAuth(
                                  "username", 1, authFieldController1),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InputFieldAuth(
                                  "password", 2, authFieldController2),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              width: double.infinity,
                              height: 45,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    authBloc.add(LoginEvent(
                                        authFieldController1.text,
                                        authFieldController2.text));
                                  },
                                  child: Text("Sign-in")),
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
                                "Sign-in",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );

              // throw AuthFailed(errorMsg: "error logging in");
            },
          ),
        ),
      ),
    );
  }
}
