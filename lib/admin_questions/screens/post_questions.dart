import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_questions/bloc/admin_questions_bloc.dart';
import 'package:hagerawi_app/admin_questions/bloc/admin_questions_event.dart';
import 'package:hagerawi_app/admin_questions/bloc/admin_questions_state.dart';
import 'package:hagerawi_app/admin_questions/repository/admin_questions_repo.dart';

class PostQuestions extends StatelessWidget {
  PostQuestions({Key? key}) : super(key: key);
  static const String routeName = "/PostQuestions";

  final question = TextEditingController();
  final choices = TextEditingController();
  final answers = TextEditingController();
  final imgUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          title: Center(
              child: Text(
            'New Questions ',
            style: TextStyle(fontSize: 30),
          )),
        ),
        body: BlocProvider(
          create: (context) => AdminQuestionBloc(AdminQuestionRepo()),
          child: BlocBuilder<AdminQuestionBloc, AdminQuestionState>(
            builder: (ctx, state) {
              final questionBloc = BlocProvider.of<AdminQuestionBloc>(ctx);

              if (state is QuestionsLoaded) {
                return Center(
                  child: Text("Posted questions successfully"),
                );
              } else if (state is QuestionsLoading) {
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
                          "Posting questions...",
                          style: TextStyle(
                              fontSize: 15, color: Colors.blueGrey.shade200),
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    theItems(question, "question"),
                    SizedBox(height: 10),
                    theItems(choices, "choices"),
                    SizedBox(height: 10),
                    theItems(answers, "answers"),
                    SizedBox(height: 10),
                    theItems(imgUrl, "imgUrl"),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 45,
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                        onPressed: () {
                          questionBloc.add(
                            PostQuestionEvent(question.text, choices.text,
                                answers.text, imgUrl.text),
                          );
                          print([
                            question.text,
                            choices.text,
                            answers.text,
                            imgUrl.text
                          ]);
                        },
                        child: Text("Post"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget theItems(ctr, String hint) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade800,
          ),
          width: 300,
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: TextField(
            controller: ctr,
            cursorHeight: 45,
            style: TextStyle(fontSize: 25, color: Colors.white24),
            decoration: InputDecoration(hintText: hint),
          ),
        ),
      ],
    );
  }
}
