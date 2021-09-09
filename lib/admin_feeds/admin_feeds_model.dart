class ListOfAdminFeeds {
  final List<AdminFeedsModel> allAdminFeeds;

  ListOfAdminFeeds({required this.allAdminFeeds});
}

// this class describes what a single AdminFeeds should contain within
class AdminFeedsModel {
  final imgUrl;
  final title;
  final desc;
  final detailed;
  final author;

  AdminFeedsModel(
      {this.imgUrl, this.title, this.author, this.desc, this.detailed});

  factory AdminFeedsModel.fromJson(Map<String, dynamic> json) {
    return AdminFeedsModel(
      imgUrl: json['imgUrl'],
      title: json['title'],
      author: json['author'],
      desc: json['content'],
      detailed: json['detailed'],
    );
  }
}
