import 'package:hagerawi_app/event/models/program_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProgramRepository {
  Future<List<ProgramModel>> getPrograms() async {
    final result = await http.Client()
        .get(Uri.parse("http://localhost:5000/events/"), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    if (result.statusCode == 200) {
      final programs = json.decode(result.body);
      // print(result.body);
      List<ProgramModel> programList = programs.map<ProgramModel>((json) {
        return ProgramModel.fromJson(json);
      }).toList();
      print("the prog List: $programList");
      return programList;
    } else {
      throw Exception('failed to load from server');
    }
    // ProgramModel parsedJson(final response) {
    //   final jsonDecoded = json.decode(response);

    //   return ProgramModel.fromJson(jsonDecoded);
    // }
  }
}
