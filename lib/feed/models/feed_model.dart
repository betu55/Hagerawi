// this class describes what a single feed should contain within
class FeedModel {
  final imgUrl;
  final title;
  final desc;
  final detailed;
  final author;
  final comments;

  FeedModel(
      {this.imgUrl,
      this.title,
      this.author,
      this.desc,
      this.detailed,
      this.comments});

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
        imgUrl: json['imgUrl'],
        title: json['title'],
        author: json['author'],
        desc: json['content'],
        detailed: json['detailed'],
        comments: json['comments']);
  }
}
