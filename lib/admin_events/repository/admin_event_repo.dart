import 'package:hagerawi_app/admin_events/model/admin_events_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminEventRepo {
  // get fututr for getting list of feeds
  Future<AdminEventsModel> postEvents(String imgUrl, int attendees,
      String postedBy, String title, String location, String content) async {
    //declare from where we will be getting our list of objects

    final result = await http.post(
      Uri.parse("http://localhost:5000/events/"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(
        <String, String>{
          "imgUrl": imgUrl.toString(),
          "attendees": attendees.toString(),
          "postedBy": postedBy.toString(),
          "title": title.toString(),
          "location": location.toString(),
          "content": content.toString(),
        },
      ),
    );

    var response = jsonDecode(result.body);
    print(response);

    if (response == null)
      throw Exception("Could not post feed!");
    else
      return AdminEventsModel.fromJson(response);
  }
}
