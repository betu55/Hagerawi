import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/components/sidebar.dart';
import 'package:hagerawi_app/quiz/bloc/blocs.dart';
import 'package:hagerawi_app/quiz/models/quiz_model.dart';
import 'package:hagerawi_app/quiz/repository/quiz_repo.dart';

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

var j = 0;
var score = 0;

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);
  static const String routeName = "/quiz";

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _myKey = GlobalKey<ScaffoldState>();
  bool checker = false;
  bool anotherchecker = false;
  var q = Questions();

  var finalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _myKey,
      drawer: Navbar(),
      body: BlocProvider(
          create: (context) => QuizBloc(QuizRepo()),
          child: BlocBuilder<QuizBloc, QuizState>(builder: (ctx, state) {
            final quizBloc = BlocProvider.of<QuizBloc>(ctx);
            // if (state is NextQuestionLoading) {
            //   return Container(
            //     child: Center(
            //       child: Text(
            //         "Are you ready?",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 28,
            //         ),
            //       ),
            //     ),
            //   );
            // }
            if (state is QuestionsLoading) {
              quizBloc.add(FetchQuizEvent());

              print(state);

              return Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "...",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              );
            }
            if (state is QuestionsLoaded) {
              List<QuizModel> questions = state.getQuestions;
              var quantity = questions.length;
              print(quantity);
              return j < (quantity)
                  ? Stack(children: [
                      Container(
                        color: Colors.grey.shade800,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Padding(
                          //   padding:
                          //       EdgeInsets.only(left: 5, right: 5, top: 50),
                          //   child: Image.asset(
                          //     questions[j].imgUrl,
                          //     scale: 1.25,
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              questions[j].question,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onTap: () async {
                                    print("touh");
                                    setState(() {
                                      checker = (questions[j].choice[i] ==
                                              questions[j].answer)
                                          ? true
                                          : true;
                                      anotherchecker =
                                          (questions[j].choice[i] ==
                                                  questions[j].answer)
                                              ? true
                                              : false;
                                    });
                                    if (anotherchecker) score = score + 1;
                                    await Future.delayed(Duration(seconds: 1));
                                    // ignore: unnecessary_statements
                                    j = j + 1;
                                    // print(state);

                                    print(state);
                                    Navigator.pushNamed(context, "/quiz");
                                    // print(state);
                                    print(score);
                                  },
                                  child: (questions[j].choice[i] ==
                                          questions[j].answer)
                                      ? yep(questions[j].choice[i],
                                          questions[j].answer)
                                      : nop(questions[j].choice[i],
                                          questions[j].answer),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
                              child: Text("Score: $score",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30)),
                            ),
                          )
                        ],
                      ),
                    ])
                  : scoreScreen(score);
            }
            throw QuestionsNotLoaded();
          })),
    );
  }

  Widget yep(String c, String d) {
    return Center(
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (checker && (c == d)) ? Colors.green : Colors.blueAccent,
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
      ),
    );
  }

  Widget nop(String c, String d) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 50,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: (checker && (c != d)) ? Colors.red : Colors.blueAccent,
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

  Widget scoreScreen(int s) {
    return Container(
      color: Colors.grey.shade800,
      width: double.infinity,
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
                BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
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
          ElevatedButton(
              onPressed: () {
                j = 0;
                score = 0;
                Navigator.pushNamed(context, "/quiz");
              },
              child: Text("Play Again?"))
        ],
      ),
    );
  }
}
