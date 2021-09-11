// this class describes what a single AdminFeeds should contain within
import 'package:hagerawi_app/components/cards.dart';

class AdminEventsModel {
  //final imgUrl;
  final String imgUrl;
  final String attendees;
  final String postedBy;
  final String title;
  final String location;
  final String content;

  AdminEventsModel({
    //required this.imgUrl,
    required this.imgUrl,
    required this.attendees,
    required this.postedBy,
    required this.title,
    required this.location,
    required this.content,
  });

  factory AdminEventsModel.fromJson(Map<String, dynamic> json) {
    return AdminEventsModel(
      imgUrl: json['imgUrl'],
      attendees: json['attendees'],
      postedBy: json['postedBy'],
      title: json['title'],
      location: json['location'],
      content: json['content'],
    );
  }
}
