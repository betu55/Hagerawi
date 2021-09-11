import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hagerawi_app/feed/models/feed_model.dart';
import 'package:hagerawi_app/feed/screens/feeds.dart';

// event base class
abstract class FeedEvent extends Equatable {}

class FetchFeedsEvent extends FeedEvent {
  FetchFeedsEvent();

  @override
  List<Object?> get props => [];
}

class SearchFeedsEvent extends FeedEvent {
  final _keyword;

  SearchFeedsEvent(this._keyword);

  @override
  List<Object?> get props => [_keyword];
}

class FeedCommentEvent extends FeedEvent {
  final _comment;

  FeedCommentEvent(this._comment);

  @override
  List<Object?> get props => [_comment];
}

class GetCommentsEvent extends FeedEvent {
  final _title;

  GetCommentsEvent(this._title);

  @override
  List<Object?> get props => [_title];
}

class PostCommentEvent extends FeedEvent {
  final _comment;
  final _title;

  PostCommentEvent(this._comment, this._title);

  @override
  List<Object?> get props => [_comment, _title];
}
