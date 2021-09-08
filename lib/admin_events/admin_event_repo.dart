import 'package:hagerawi_app/feed/feed_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedRepo {
  // get fututr for getting list of feeds
  Future<List<FeedPostModel>> getFeeds() async {
    //declare from where we will be getting our list of objects
    final result = await http.Client()
        .get(Uri.parse("http://localhost:5000/feeds/"), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    if (result.statusCode == 200) {
      final feeds = json.decode(result.body).cast<Map<String, dynamic>>();
      //print(feeds);

      List<FeedPostModel> feedList = feeds.map<FeedPostModel>((json) {
        return FeedPostModel.fromJson(json);
      }).toList();

      // print(feedList[0].author);
      return feedList;
    } else {
      throw Exception('failed to load from server');
    }
  }

  // Future<FeedModel> getSingleFeed() {}
}
