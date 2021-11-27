import 'package:hagerawi_app/admin_feeds/models/admin_feeds_model.dart';

abstract class AdminFeedState {}

class FeedsUploading extends AdminFeedState {}

class FeedsUploaded extends AdminFeedState {
  final String _title;
  final String _author;
  final String _content;
  final String _detailed;

  FeedsUploaded(this._title, this._author, this._content, this._detailed);
}

class AdminFeedsNotUploaded extends AdminFeedState {}

class FeedOperationSuccess extends AdminFeedState {
  final AdminFeedsModel feeds;

  FeedOperationSuccess(this.feeds);
}

class FeedOperationFailed extends AdminFeedState {}

class UploadingFailed extends AdminFeedState {
  final String errorMsg;

  UploadingFailed({required this.errorMsg});
  String get getErrorMsg => errorMsg;
}
