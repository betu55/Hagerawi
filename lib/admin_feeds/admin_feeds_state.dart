import 'dart:async';
import 'dart:html';

import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';


abstract class AdminFeedState {}

class FeedsUploading extends AdminFeedState {}

class FeedsUploaded extends AdminFeedState {
  final String _title;
  final String _author;
  final String _desc;
  final String _detailed;

  FeedsUploaded(this._title, this._author,this._desc, this._detailed);
  String get getTitle => _title;
  //String get props => [newPost];

  //String toString() => 'AddSongSuccess{ newPost: $newPost}';
}

class FeedsUpload extends AdminFeedState {}

class AdminFeedsNotUploaded extends AdminFeedState {
  final String errorMsg;

  AdminFeedsNotUploaded({required this.errorMsg});

  String get getErrorMsg => errorMsg;
}


