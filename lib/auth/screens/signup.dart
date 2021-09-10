import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_bloc.dart';
import 'package:hagerawi_app/auth/bloc/auth_state.dart';
import 'package:hagerawi_app/auth/repository/auth_repo.dart';
import 'package:hagerawi_app/auth/bloc/auth_event.dart';
import 'package:hagerawi_app/main.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/auth/screens/login.dart';

const kPrimaryColor = Color(0xff777777);
const kPrimaryLightColor = Colors.white;

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  static const String routeName = "/signup";

  final authFieldController1 = TextEditingController();

  final authFieldController2 = TextEditingController();

  final authFieldController3 = TextEditingController();

  final authFieldController4 = TextEditingController();

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
        child: SafeArea(child: BlocBuilder<AuthBloc, AuthState>(
          builder: (ctx, state) {
            final authBloc = BlocProvider.of<AuthBloc>(ctx);
            if (state is LoggedOut) {
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
                                  "username", 0, authFieldController1),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InputFieldAuth(
                                  "email", 1, authFieldController4),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InputFieldAuth(
                                  "password", 2, authFieldController2),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: InputFieldAuth(
                                  "confirm password", 2, authFieldController3),
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
                                    authBloc.add(SignupEvent(
                                        authFieldController1.text,
                                        authFieldController2.text,
                                        authFieldController3.text));
                                    // Navigator.pushNamed(context, "/feeds");
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
            }

            if (state is SignupInProgress) {
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
                        "signing up user...",
                        style: TextStyle(
                            fontSize: 15, color: Colors.blueGrey.shade200),
                      ),
                      SizedBox(height: 14),
                    ],
                  ),
                ),
              );
            }
            if (state is SignupSucess) {
              Center(
                child: Text('Signup successful'),
              );
              Navigator.pushNamed(context, "/login");
            }
            if (state is AuthFailed) {
              return Center(
                child: Text("${state.errorMsg}"),
              );
            }
            throw AuthFailed(errorMsg: "error registering");
          },
        )),
      ),
    );
  }
}