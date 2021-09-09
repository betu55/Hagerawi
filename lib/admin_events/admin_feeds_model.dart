/* class ListOfAdminFeeds {
  final List<AdminFeedsModel> allAdminFeeds;

  ListOfAdminFeeds({required this.allAdminFeeds});
} */

// this class describes what a single AdminFeeds should contain within
class AdminFeedsModel {
  //final imgUrl;
  final String title;
  final String desc;
  final String detailed;
  final String author;

  AdminFeedsModel(
      { //required this.imgUrl,
      required this.title,
      required this.author,
      required this.desc,
      required this.detailed});

  factory AdminFeedsModel.fromJson(Map<String, dynamic> json) {
    return AdminFeedsModel(
      title: json['title'],
      author: json['author'],
      desc: json['desc'],
      detailed: json['detailed'],
    );
  }

  /* factory AdminFeedsModel.fromJson(Map<String, dynamic> json) {
    return AdminFeedsModel(
      imgUrl: json['imgUrl'],
      title: json['title'],
      author: json['author'],
      desc: json['content'],
      detailed: json['detailed'],
    );
  } */
}

class UpdatePost extends AdminFeedsModel {
  UpdatePost({
    required title,
    required desc,
    required detailed,
    required author,
  }) : super(title: title, desc: desc, detailed: detailed, author: author);

  UpdatePost copyWith({
    String? title,
    int? desc,
    String? detailed,
    String? author,
  }) =>
      UpdatePost(
        title: title ?? this.title,
        desc: desc ?? this.desc,
        detailed: detailed ?? this.detailed,
        author: author ?? this.author,
      );
}
