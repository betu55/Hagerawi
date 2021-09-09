import 'dart:async';
import 'dart:html';

import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';


abstract class AdminFeedState {}

class FeedsUploading extends AdminFeedState {}

class FeedsUploaded extends AdminFeedState {
  final AdminFeedsModel newPost;

  FeedsUploaded(this.newPost);

  List<Object> get props => [newPost];

  String toString() => 'AddSongSuccess{ newPost: $newPost}';
}

class FeedSearched extends AdminFeedState {}

class FeedsUpload extends AdminFeedState {}

class AdminFeedsNotUploaded extends AdminFeedState {}


class AuthFailed extends AdminFeedState {
  final String errorMsg;

  AuthFailed({required this.errorMsg});
}

