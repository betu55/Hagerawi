class ListOfFeeds {
  final List<FeedModel> allFeeds;

  ListOfFeeds({required this.allFeeds});
}

// this class describes what a single feed should contain within
class FeedModel {
  final imgUrl;
  final title;
  final desc;
  final detailed;
  final author;

  FeedModel({this.imgUrl, this.title, this.author, this.desc, this.detailed});

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      imgUrl: json['imgUrl'],
      title: json['title'],
      author: json['author'],
      desc: json['content'],
      detailed: json['detailed'],
    );
  }
}
