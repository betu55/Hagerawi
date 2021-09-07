import 'dart:async';

import 'package:hagerawi_app/feed/feed_model.dart';

// event base class
class FeedEvent {}

class FetchFeedsEvent extends FeedEvent {
  FetchFeedsEvent();
}

class SearchFeedEvent extends FeedEvent {}

// state base class
class FeedState {}

class FeedsLoading extends FeedState {}

class FeedsLoaded extends FeedState {
  List<FeedModel> _feeds;

  FeedsLoaded(this._feeds);

  List<FeedModel> get getFeeds => _feeds;
}

class FeedSearched extends FeedState {}

class FeedsNotLoaded extends FeedState {}
