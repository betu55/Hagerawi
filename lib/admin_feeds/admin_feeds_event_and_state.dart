import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hagerawi_app/pages/feeds_post.dart';

// event base class
abstract class AdminFeedEvent extends Equatable {}

class PostFeedsEvent extends AdminFeedEvent {
  PostFeedsEvent(this._title, this._author, this._content, this._detailed);

  final String _title;
  final String _author;
  final String _content;
  final String _detailed;

  @override
  List<Object?> get props => [_title, _author, _content, _detailed];
}

// state base class
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

class UploadingFailed extends AdminFeedState {
  final String errorMsg;

  UploadingFailed({required this.errorMsg});
  String get getErrorMsg => errorMsg;
}
