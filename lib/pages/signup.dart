import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hagerawi_app/pages/events.dart';
import 'package:hagerawi_app/pages/login.dart';

import 'events.dart';

const kPrimaryColor = Color(0xff777777);
const kPrimaryLightColor = Colors.white;

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  static const String routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade900,
      statusBarIconBrightness: Brightness.light,
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                  height: size.height / 1.5,
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
                ),
                //this is the bottom link
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("hi"),
                      Text(
                        "hello",
                        style: TextStyle(color: Colors.amberAccent),
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
