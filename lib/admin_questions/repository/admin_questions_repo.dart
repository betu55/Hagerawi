import 'package:hagerawi_app/admin_feeds/models/admin_feeds_model.dart';
import 'package:hagerawi_app/admin_questions/model/admin_questions_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminQuestionRepo {
  // get fututr for getting list of questions
  Future<AdminQuestionsModel> postQuestions(
      String question, String choices, String answers, String imgUrl) async {
    // declare from where we will be getting our list of objects

    final result = await http.post(
      Uri.parse("http://localhost:5000/questions/"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(
        <String, String>{
          "question": question.toString(),
          "choices": choices.toString(),
          "answers": answers.toString(),
          "imgUrl": imgUrl.toString(),
        },
      ),
    );

    var response = jsonDecode(result.body);
    print(response);

    if (response == null)
      throw Exception("Could not post feed!");
    else
      return AdminQuestionsModel.fromJson(response);
  }

  Future<AdminQuestionsModel> updateQuestions(String id) async {
    final result = await http.patch(
      Uri.parse('http://localhost:5000/questions/${id}'),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(
        <String, String>{
          "id": id,
        },
      ),
    );

    var res = jsonDecode(result.body);

    if (res == null)
      throw Exception("Could not update question");
    else
      return AdminQuestionsModel.fromJson(res);
  }

  Future<AdminQuestionsModel> deleteQuestions(String id) async {
    final result = await http.delete(
      Uri.parse('http://localhost:5000/questions/${id}'),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(
        <String, String>{
          "id": id,
        },
      ),
    );

    var res = jsonDecode(result.body);

    if (res == null)
      throw Exception("Could not update question");
    else
      return AdminQuestionsModel.fromJson(res);
  }
}
