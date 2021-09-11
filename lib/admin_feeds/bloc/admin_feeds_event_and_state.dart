import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hagerawi_app/admin_feeds/screens/feeds_post.dart';

// event base class
abstract class AdminFeedEvent extends Equatable {}

class PostFeedsEvent extends AdminFeedEvent {

  final String title;
  final String author;
  final String content;
  final String detailed;

  PostFeedsEvent(this.title, this.author, this.content, this.detailed);
  
  @override
  List<Object?> get props => [title, author, content, detailed];
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