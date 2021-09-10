import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/auth/repository/auth_repo.dart';
import 'package:hagerawi_app/feed/bloc/feed_bloc.dart';
import 'package:hagerawi_app/feed/bloc/feed_state.dart';
import 'package:hagerawi_app/main.dart';
import 'package:hagerawi_app/pages/events.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/auth/screens/login.dart';

const kPrimaryColor = Color(0xff777777);
const kPrimaryLightColor = Colors.white;

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  static const String routeName = "/signup";

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final feedBloc = BlocProvider.of<FeedBloc>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade900,
      statusBarIconBrightness: Brightness.light,
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => AuthBloc(AuthRepo()),
        child: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (ctx, state) {
              final authState = BlocProvider.of<AuthBloc>(ctx);

              if (state is Registered) {
                return Container(
                  alignment: Alignment.center,
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
                      Text(
                        "Registration successful!",
                        style: TextStyle(
                          color: Colors.grey.shade200.withAlpha(120),
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        height: 45,
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          onPressed: () {
                            usernameController.text = '';
                            passwordController.text = '';
                            confirmController.text = '';
                            Navigator.pushNamed(context, Login.routeName);
                          },
                          child: Text("Sign-in"),
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (state is RegistrationInProgress) {
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
                                  "Sign-Up",
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
                                    "username", 0, usernameController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "password", 2, passwordController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "confirm password", 2, confirmController),
                              ),
                              SizedBox(
                                height: 20,
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
                                      // feedBloc.add(FetchFeedsEvent());
                                      // Navigator.pushNamed(context, "/feeds");
                                      if (usernameController.text == "" ||
                                          passwordController.text == "" ||
                                          confirmController.text == "") {
                                        authState.add(EmptyFields());
                                        return;
                                      }
                                      if (passwordController.text !=
                                          confirmController.text) {
                                        authState.add(PasswordsDontMatch());
                                        return;
                                      }
                                      authState.add(
                                        RegisterEvent(
                                          usernameController.text,
                                          passwordController.text,
                                        ),
                                      );
                                    },
                                    child: Text("Sign-Up")),
                              ),
                              SizedBox(height: 15),
                              Container(
                                padding: EdgeInsets.all(4),
                                child: CircularProgressIndicator(
                                  color: Colors.grey.shade200.withAlpha(120),
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
                                "Already have an account? | ",
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
                                        return Login();
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
              if (state is UserAlreadyExists) {
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
                                  "Sign-Up",
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
                                    "username", 0, usernameController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "password", 2, passwordController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "confirm password", 2, confirmController),
                              ),
                              SizedBox(
                                height: 20,
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
                                      // feedBloc.add(FetchFeedsEvent());
                                      // Navigator.pushNamed(context, "/feeds");
                                      if (usernameController.text == "" ||
                                          passwordController.text == "" ||
                                          confirmController.text == "") {
                                        authState.add(EmptyFields());
                                        return;
                                      }
                                      if (passwordController.text !=
                                          confirmController.text) {
                                        authState.add(PasswordsDontMatch());
                                        return;
                                      }
                                      authState.add(
                                        RegisterEvent(
                                          usernameController.text,
                                          passwordController.text,
                                        ),
                                      );
                                    },
                                    child: Text("Sign-Up")),
                              ),
                              SizedBox(height: 15),
                              Container(
                                padding: EdgeInsets.all(4),
                                color: Colors.yellow,
                                child: Text(
                                  "Username already exists!",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              )
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
                                "Already have an account? | ",
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
                                        return Login();
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

              if (state is EmpFieldState) {
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
                                  "Sign-Up",
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
                                    "username", 0, usernameController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "password", 2, passwordController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "confirm password", 2, confirmController),
                              ),
                              SizedBox(
                                height: 20,
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
                                      // feedBloc.add(FetchFeedsEvent());
                                      // Navigator.pushNamed(context, "/feeds");
                                      if (usernameController.text == "" ||
                                          passwordController.text == "" ||
                                          confirmController.text == "") {
                                        authState.add(EmptyFields());
                                        return;
                                      }
                                      if (passwordController.text !=
                                          confirmController.text) {
                                        authState.add(PasswordsDontMatch());
                                        return;
                                      }
                                      authState.add(
                                        RegisterEvent(
                                          usernameController.text,
                                          passwordController.text,
                                        ),
                                      );
                                    },
                                    child: Text("Sign-Up")),
                              ),
                              SizedBox(height: 15),
                              Container(
                                padding: EdgeInsets.all(4),
                                color: Colors.yellow,
                                child: Text(
                                  "one or more required field missing!",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              )
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
                                "Already have an account? | ",
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
                                        return Login();
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

              if (state is PassDontMatchState) {
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
                                  "Sign-Up",
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
                                    "username", 0, usernameController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "password", 2, passwordController),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: InputFieldAuth(
                                    "confirm password", 2, confirmController),
                              ),
                              SizedBox(
                                height: 20,
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
                                      // feedBloc.add(FetchFeedsEvent());
                                      // Navigator.pushNamed(context, "/feeds");
                                      if (usernameController.text == "" ||
                                          passwordController.text == "" ||
                                          confirmController.text == "") {
                                        authState.add(EmptyFields());
                                        return;
                                      }
                                      if (passwordController.text !=
                                          confirmController.text) {
                                        authState.add(PasswordsDontMatch());
                                        return;
                                      }
                                      authState.add(
                                        RegisterEvent(
                                          usernameController.text,
                                          passwordController.text,
                                        ),
                                      );
                                    },
                                    child: Text("Sign-Up")),
                              ),
                              SizedBox(height: 15),
                              Container(
                                padding: EdgeInsets.all(4),
                                color: Colors.yellow,
                                child: Text(
                                  "passwords do not match, please try again",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              )
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
                                "Already have an account? | ",
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
                                        return Login();
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
                                "Sign-Up",
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
                                  "username", 0, usernameController),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InputFieldAuth(
                                  "password", 2, passwordController),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InputFieldAuth(
                                  "confirm password", 2, confirmController),
                            ),
                            SizedBox(
                              height: 20,
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
                                    // feedBloc.add(FetchFeedsEvent());
                                    // Navigator.pushNamed(context, "/feeds");
                                    if (usernameController.text == "" ||
                                        passwordController.text == "" ||
                                        confirmController.text == "") {
                                      authState.add(EmptyFields());
                                      return;
                                    }
                                    if (passwordController.text !=
                                        confirmController.text) {
                                      authState.add(PasswordsDontMatch());
                                      return;
                                    }
                                    // print([
                                    //   usernameController.text,
                                    //   passwordController.text
                                    // ]);
                                    authState.add(
                                      RegisterEvent(
                                        usernameController.text,
                                        passwordController.text,
                                      ),
                                    );
                                  },
                                  child: Text("Sign-Up")),
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
                              "Already have an account? | ",
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
                                      return Login();
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
            },
          ),
        ),
      ),
    );
  }
}
