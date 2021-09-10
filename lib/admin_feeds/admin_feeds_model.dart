// this class describes what a single AdminFeeds should contain within
class AdminFeedsModel {
  final title;
  final content;
  final detailed;
  final author;

  AdminFeedsModel(
      {this.title, this.author, this.content, this.detailed});

  factory AdminFeedsModel.fromJson(Map<String, dynamic> json) {
    return AdminFeedsModel(
      title: json['title'],
      author: json['author'],
      content: json['content'],
      detailed: json['detailed'],
    );
  }
}
