import 'package:equatable/equatable.dart';

// event base class
abstract class AdminEventsEvent extends Equatable {}

class PostEventsEvent extends AdminEventsEvent {
  final String imgUrl;
  final String attendees;
  final String postedBy;
  final String title;
  final String location;
  final String content;

  PostEventsEvent(
    this.imgUrl,
    this.attendees,
    this.postedBy,
    this.title,
    this.location,
    this.content,
  );

  @override
  List<Object?> get props =>
      [imgUrl, attendees, postedBy, title, location, content];
}

class UpdateEventsEvent extends AdminEventsEvent {
  final String id;

  UpdateEventsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteEventsEvent extends AdminEventsEvent {
  final String id;

  DeleteEventsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
