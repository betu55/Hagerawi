import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hagerawi_app/admin_feeds/screens/feeds_post.dart';
import 'package:hagerawi_app/admin_questions/screens/post_questions.dart';

import 'package:hagerawi_app/quiz/bloc/trial.dart';
import 'package:hagerawi_app/quiz/screens/quiz.dart';
import 'auth/screens/signup.dart';
import 'auth/screens/login.dart';
import 'package:hagerawi_app/pages/events.dart';
import 'package:hagerawi_app/pages/single_event.dart';
import 'package:hagerawi_app/admin_events/screens/events_post.dart';

import 'event/screens/program.dart';

void doSth() {
  print("working progress real <.>");
}

void main() {
  GestureBinding.instance?.resamplingEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {
        PostQuestions.routeName: (BuildContext context) => PostQuestions(),
        PostFeeds.routeName: (BuildContext context) => PostFeeds(),
        Trial.routeName: (BuildContext context) => Trial(),
        Signup.routeName: (BuildContext context) => Signup(),
        Login.routeName: (BuildContext context) => Login(),
        Quiz.routeName: (BuildContext context) => Quiz(),
        EventsPage.routeName: (BuildContext context) => EventsPage(),
        ProgramsPage.routeName: (BuildContext context) => ProgramsPage(),
        SingleEvent.routeName: (BuildContext context) => SingleEvent(
              title: "",
              detail: "",
              author: "",
            ),
        // SingleEvent.routeName: (BuildContext context) => SingleEvent(),
        PostEvents.routeName: (BuildContext context) => PostEvents(),
      },
    ),
  );
}
