import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hagerawi_app/feed/models/feed_model.dart';

// event base class
abstract class FeedEvent extends Equatable {}

class FetchFeedsEvent extends FeedEvent {
  FetchFeedsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchFeedsEvent extends FeedEvent {
  final _keyword;

  SearchFeedsEvent(this._keyword);

  @override
  // TODO: implement props
  List<Object?> get props => [_keyword];
}
