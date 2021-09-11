abstract class AdminEventState {}

class EventsUploading extends AdminEventState {}

class EventsUploaded extends AdminEventState {
  final String imgUrl;
  final int attendees;
  final String postedBy;
  final String title;
  final String location;
  final String content;

  EventsUploaded(    
    this.imgUrl,
    this.postedBy,
    this.attendees,
    this.title,
    this.location,
    this.content,);
}

class AdminEventNotUploaded extends AdminEventState {}

class UploadingFailed extends AdminEventState {
  final String errorMsg;

  UploadingFailed({required this.errorMsg});
  String get getErrorMsg => errorMsg;
}