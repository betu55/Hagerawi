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

  // retrives the list of comments available for a single feed specified by its title
  Future<List> getComments(String byTitle) async {
    // print(keyword);
    final result = await http.Client().get(
      Uri.parse("http://localhost:5000/feeds/$byTitle"),
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
    );

    print("\n${result.body}\n");

    var theFeed;
    try {
      theFeed = await jsonDecode(result.body);
      // print("\n${theFeed[0]['comments']}\n");
    } catch (e) {
      // print(e);
    }
    // print("the comments are: ${theFeed[0]['comments']}");
    return theFeed[0]['comments'];
  }

  Future<List> postComment(String comment, String title) async {
    final List currentComments = await getComments(title);
    currentComments.add(comment);
    final updatedComments = currentComments;

    final result = await http.Client().patch(
      Uri.parse("http://localhost:5000/feeds/$title"),
      body: jsonEncode(
        <String, List<dynamic>>{
          "comments": updatedComments,
        },
      ),
    );
    try {
      // var updatedComm = jsonDecode(result.body);
      print("the res: ${result.body}");
    } catch (error1) {
      print("the err is: $error1");
    }

    if (result.statusCode == 204) {
      print("success status");
      var updatedComm1 = jsonDecode(result.body);
      return updatedComm1[0]['comments'];
    } else {
      throw Exception("couldn't send req");
    }
  }
}
