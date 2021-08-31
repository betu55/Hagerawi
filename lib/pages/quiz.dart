import 'package:flutter/material.dart';

class Questions {
  final questions = ["Demo question 1?", "Demo question 2", "Demo question 3"];
  final choices = [
    ["choice 1", "choice 2", "choice 3", "choice 4"],
    ["choice 1", "choice 2", "choice 3", "choice 3"],
    ["choice 1", "choice 2", "choice 3", "choice 4"],
  ];
  final answers = [
    "choice 2",
    "choice 3",
    "choice 1",
  ];
}

class Quiz extends StatelessWidget {
  static const String routeName = "/quiz";
  bool checker = false;
  final q = Questions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.blue[200],
          ),
          Choices(),
        ],
      ),
    );
  }

  // Widget choices(String c) {
  //   return Choices(c);
  // }
}

class Choices extends StatefulWidget {
  const Choices({Key? key}) : super(key: key);

  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  var q = Questions();
  bool checker = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 50),
          child: Image.asset(
            "assets/atse.jpg",
            scale: 1.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            q.questions[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: q.choices.length + 1,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    checker = (q.choices[0][i] == q.answers[0]) ? true : false;
                  });
                },
                child: yep(q.choices[0][i]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget yep(String c) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 50,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            (checker && (c == q.answers[0])) ? Colors.green : Colors.blueAccent,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          c,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
