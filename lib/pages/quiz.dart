import 'package:flutter/material.dart';

var j = 0;
var finalScore = 0;

class Questions {
  final questions = ["Demo question 1?", "Demo question 2", "Demo question 3"];
  final choices = [
    ["choice 1", "choice 2", "choice 3", "choice 4"],
    ["choice 1", "choice 2", "choice 3", "choice 4"],
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
}

class Choices extends StatefulWidget {
  const Choices({Key? key}) : super(key: key);

  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  // final j = 0;
  var q = Questions();
  bool checker = false;
  bool anotherchecker = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Padding(
        //   padding: EdgeInsets.only(left: 5, right: 5, top: 50),
        //   child: Image.asset(
        //     "assets/atse.jpg",
        //     scale: 1.25,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            q.questions[j],
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
                onTap: () async {
                  setState(() {
                    checker = (q.choices[j][i] == q.answers[j]) ? true : true;
                    anotherchecker =
                        (q.choices[j][i] == q.answers[j]) ? true : false;
                  });
                  if (anotherchecker) finalScore = finalScore + 1;
                  await Future.delayed(Duration(seconds: 1));
                  j = j + 1;
                  if (j > 2) j = 0;
                  Navigator.pushNamed(context, "/quiz");
                  print(finalScore);
                },
                child: (q.choices[j][i] == q.answers[j])
                    ? yep(q.choices[j][i])
                    : nop(q.choices[j][i]),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Text("Score: $finalScore",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ),
        )
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
            (checker && (c == q.answers[j])) ? Colors.green : Colors.blueAccent,
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

  Widget nop(String c) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 50,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            (checker && (c != q.answers[j])) ? Colors.red : Colors.blueAccent,
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
