import 'package:hagerawi_app/feed/models/feed_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedRepo {
  // get fututr for getting list of feeds
  Future<List<FeedModel>> getFeeds() async {
    //declare from where we will be getting our list of objects
    final result = await http.Client()
        .get(Uri.parse("http://localhost:5000/feeds/"), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    if (result.statusCode == 200) {
      final feeds = json.decode(result.body);
      //print(feeds);

      List<FeedModel> feedList = feeds.map<FeedModel>((json) {
        return FeedModel.fromJson(json);
      }).toList();

      // print(feedList[0].author);
      return feedList;
    } else {
      throw Exception('failed to load from server');
    }
  }

  Future<List<FeedModel>> getSearchedFeeds(String keyword) async {
    // print(keyword);
    final result = await http.Client()
        .get(Uri.parse("http://localhost:5000/feeds/$keyword"), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    if (result.statusCode == 200) {
      final feeds = json.decode(result.body);
      print(feeds.length);

      List<FeedModel> searchedFeedList = feeds.map<FeedModel>((json) {
        return FeedModel.fromJson(json);
      }).toList();
      print(searchedFeedList.length);
      return searchedFeedList;
    } else {
      throw Exception('failed to load from server');
    }
  }
}
