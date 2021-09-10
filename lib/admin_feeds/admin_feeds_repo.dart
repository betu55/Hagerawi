import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminFeedRepo {
  // get fututr for getting list of feeds
  Future<AdminFeedsModel> postFeeds(
      String title, String author, String content, String detailed) async {
    //declare from where we will be getting our list of objects
    final result = await http.Client().post(
      Uri.parse("http://localhost:5000/feeds/"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(
        <String, String>{
          "title": title.toString(),
          "author": author.toString(),
          "content": content.toString(),
          "detailed": detailed.toString(),
        },
      ),
    );

    var response = jsonDecode(result.body);

    if (response == null)
      throw Exception("Could not post feed!");
    else
      return AdminFeedsModel.fromJson(response);
  }
}
