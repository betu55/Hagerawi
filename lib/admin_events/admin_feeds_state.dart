import 'dart:async';

import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';


abstract class AdminFeedState {}

class FeedsUploading extends AdminFeedState {}

class FeedsUploaded extends AdminFeedState {
  List<AdminFeedsModel> _feeds;

  FeedsUploaded(this._feeds);

  List<AdminFeedsModel> get getFeeds => _feeds;
}

class FeedSearched extends AdminFeedState {}

class AdminFeedsNotUploaded extends AdminFeedState {}


class AuthFailed extends AdminFeedState {
  final String errorMsg;

  AuthFailed({required this.errorMsg});
}

