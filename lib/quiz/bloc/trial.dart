import 'package:flutter/material.dart';
import 'package:hagerawi_app/quiz/screens/quiz.dart';

class Trial extends StatelessWidget {
  const Trial({Key? key}) : super(key: key);
  static const String routeName = "/trial";

  @override
  Widget build(BuildContext context) {
    return scoreScreen(3);
  }
}

Widget scoreScreen(int s) {
  return Container(
    color: Colors.grey.shade800,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Your Score is",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        Container(
          decoration:
              BoxDecoration(color: Colors.white70, shape: BoxShape.rectangle),
          padding: EdgeInsets.all(6.0),
          child: Text(
            "$s",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 37.0,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}
