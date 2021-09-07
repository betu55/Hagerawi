import 'package:hagerawi_app/event/models/program_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProgramRepository {
  Future<ProgramModel> getProgram() async {
    Uri url = Uri.parse("localhost:5000/events/");
    final result = await http.Client().get(url);

    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  ProgramModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    return ProgramModel.fromJson(jsonDecoded);
  }
}
