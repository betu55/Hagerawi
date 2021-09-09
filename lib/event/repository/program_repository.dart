import 'package:hagerawi_app/event/models/program_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProgramRepository {
  Future<List<ProgramModel>> getPrograms() async {
    Uri url = Uri.parse("localhost:5000/events/");
    final result = await http.Client().get(url, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    if (result.statusCode == 200) {
      final programs = json.decode(result.body);
      List<ProgramModel> programList = programs.map<ProgramModel>((json) {
        return ProgramModel.fromJson(json);
      }).toList();
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
