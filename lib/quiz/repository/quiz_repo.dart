import 'package:hagerawi_app/quiz/models/quiz_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizRepo {
  // get fututr for getting list of feeds
  Future<List<QuizModel>> getQuestions() async {
    //declare from where we will be getting our list of objects
    final result = await http.Client()
        .get(Uri.parse("http://localhost:5000/questions/"), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    if (result.statusCode == 200) {
      final questions = json.decode(result.body);
      //print(feeds);

      List<QuizModel> questionsList = questions.map<QuizModel>((json) {
        return QuizModel.fromJson(json);
      }).toList();

      // print(feedList[0].author);
      return questionsList;
    } else {
      throw Exception('failed to load from server');
    }
  }
}
