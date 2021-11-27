import 'package:hagerawi_app/admin_events/model/admin_events_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminEventRepo {
  Future<AdminEventsModel> postEvents(String imgUrl, String attendees,
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
        <String, dynamic>{
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

    if (result.statusCode != 200) {
      print(result.statusCode);
      throw Exception("Could not post event!");
    } else {
      print(result.statusCode);
      return AdminEventsModel.fromJson(response);
    }
  }

  Future<AdminEventsModel> updateEvents(String id) async {
    final result = await http.patch(
      Uri.parse("http://localhost:5000/events/$id"),
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

    var response = jsonDecode(result.body);
    print(response);

    if (result.statusCode != 201) {
      print(result.statusCode);
      throw Exception("Could not update event!");
    } else {
      print(result.statusCode);
      return AdminEventsModel.fromJson(response);
    }
  }

  Future<AdminEventsModel> deleteEvent(String id) async {
    final result = await http.delete(
      Uri.parse("http://localhost:5000/events/$id"),
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

    var response = jsonDecode(result.body);
    print(response);

    if (result.statusCode != 201) {
      print(result.statusCode);
      throw Exception("Could not delete evnet!");
    } else {
      print(result.statusCode);
      return AdminEventsModel.fromJson(response);
    }
  }
}
