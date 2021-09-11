import 'dart:async';

import 'package:equatable/equatable.dart';

// event base class
abstract class AdminEventsEvent extends Equatable {}

class PostEventsEvent extends AdminEventsEvent {
  final String imgUrl;
  final int attendees;
  final String postedBy;
  final String title;
  final String location;
  final String content;

  PostEventsEvent(
    this.imgUrl,
    this.postedBy,
    this.attendees,
    this.title,
    this.location,
    this.content,
  );

  @override
  List<Object?> get props =>
      [imgUrl, attendees, postedBy, title, location, content];
}
