import 'package:hagerawi_app/admin_events/model/admin_events_model.dart';

abstract class AdminEventState {}

class EventsUploading extends AdminEventState {}

class EventsUploaded extends AdminEventState {
  final String imgUrl;
  final String attendees;
  final String postedBy;
  final String title;
  final String location;
  final String content;

  EventsUploaded(
    this.imgUrl,
    this.attendees,
    this.postedBy,
    this.title,
    this.location,
    this.content,
  );
}

class EventsOperationSuccess extends AdminEventState {
  final AdminEventsModel events;

  EventsOperationSuccess(this.events);
}

class EventsOperationFailed extends AdminEventState {}

class AdminEventNotUploaded extends AdminEventState {}

class UploadingFailed extends AdminEventState {
  final String errorMsg;

  UploadingFailed({required this.errorMsg});
  String get getErrorMsg => errorMsg;
}
