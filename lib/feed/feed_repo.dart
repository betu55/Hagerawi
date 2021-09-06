import 'package:hagerawi_app/feed/feed_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedRepo {
  Future<List<FeedModel>> getFeeds() async {
    //declare from where we will be getting our list of objects
    final result = await http.Client()
        .get(Uri.parse("http://localhost:5000/feeds/"), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    List<FeedModel> feeds = [];

    if (result.statusCode != 200) print("error_fetching");
    print(json.decode(result.body).length);
    final theFeeds = json.decode(result.body);
    for (var Feed in theFeeds) {
      feeds.add(Feed);
    }

    print("\n");
    for (FeedModel fd in feeds) {
      print("\n $fd");
    }
    return feeds;
  }
}
