import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagerawi_app/pages/quiz.dart';
import 'package:hagerawi_app/pages/signup.dart';
import 'package:hagerawi_app/pages/login.dart';
import 'package:hagerawi_app/pages/events.dart';

void doSth() {
  print("working progress real <.>");
}

void main() {
  GestureBinding.instance?.resamplingEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Login(),

    initialRoute: Signup.routeName,

    routes: {
      Signup.routeName: (BuildContext context) => Signup(),
      Login.routeName: (BuildContext context) => Login(),
      Quiz.routeName: (BuildContext context) => Quiz(),
      EventsPage.routeName: (BuildContext context) => EventsPage(),
    },
  ));
}
