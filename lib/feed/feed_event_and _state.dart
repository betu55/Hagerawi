// event base class
class FeedEvent {}

class FetchFeedsEvent extends FeedEvent {}

class SearchFeedsEvent extends FeedEvent {}

// state base class
class FeedState {}

class FeedsLoaded extends FeedState {}

class FeedsLoading extends FeedState {}

class FeedsNotLoaded extends FeedState {}
