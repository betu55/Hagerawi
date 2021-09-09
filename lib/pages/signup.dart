import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/feed/bloc/feed_bloc.dart';
import 'package:hagerawi_app/feed/bloc/feed_state.dart';
import 'package:hagerawi_app/main.dart';
import 'package:hagerawi_app/pages/events.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/pages/login.dart';

const kPrimaryColor = Color(0xff777777);
const kPrimaryLightColor = Colors.white;

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  static const String routeName = "/signup";

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
                          "Sign-Up",
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
                        child: InputFieldAuth("email", 1),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: InputFieldAuth("password", 2),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: InputFieldAuth("confirm password", 2),
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
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey,
                            ),
                            onPressed: () {
                              // feedBloc.add(FetchFeedsEvent());
                              Navigator.pushNamed(context, "/programs");
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
        ),
      ),
    );
  }
}
