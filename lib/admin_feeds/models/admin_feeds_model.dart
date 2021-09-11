/* class ListOfAdminFeeds {
  final List<AdminFeedsModel> allAdminFeeds;

  ListOfAdminFeeds({required this.allAdminFeeds});
} */

// this class describes what a single AdminFeeds should contain within
class AdminFeedsModel {
  //final imgUrl;
  final String title;
  final String content;
  final String detailed;
  final String author;

  AdminFeedsModel(
      {//required this.imgUrl, 
      required this.title, 
      required this.author, 
      required this.content, 
      required this.detailed});

      factory AdminFeedsModel.fromJson(Map<String, dynamic> json) {
    return AdminFeedsModel(
      title: json['title'],
      author: json['author'],
      content: json['content'],
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


