import 'dart:async';

import 'package:hagerawi_app/feed/models/feed_model.dart';

// state base class
abstract class FeedState {}

class FeedsLoading extends FeedState {}

class SearchFeedsLoading extends FeedState {}

class FeedsLoaded extends FeedState {
  List<FeedModel> _feeds;

  FeedsLoaded(this._feeds);

  List<FeedModel> get getFeeds => _feeds;
}

class FeedSearched extends FeedState {
  List<FeedModel> _searchedFeeds;

  FeedSearched(this._searchedFeeds);

  List<FeedModel> get getSearchedFeeds => _searchedFeeds;
}

class FeedsNotLoaded extends FeedState {}

class FeedCommentLoading extends FeedState {}

class FeedCommentLoaded extends FeedState {
  List _comments;
  FeedCommentLoaded(this._comments);
  List get getComments => _comments;
}

class FeedCommentNotLoaded extends FeedState {}
