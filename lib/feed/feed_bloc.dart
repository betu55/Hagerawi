import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/feed/feed_event_and_state.dart';
import 'package:hagerawi_app/feed/feed_model.dart';
import 'package:hagerawi_app/feed/feed_repo.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedRepo feedRepo;
  FeedBloc(this.feedRepo) : super(FeedsLoading());

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    // on the case that our user opens the page for the first time
    if (event is FetchFeedsEvent) {
      // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
      yield FeedsLoading();
      // await Future.delayed(Duration(seconds: 15));
      try {
        List<FeedModel> feeds = await feedRepo.getFeeds();

        // print(feeds[0].detailed);
        yield FeedsLoaded(feeds);
      } catch (_) {
        yield FeedsNotLoaded();
      }
    }

    // when the user searchs for a specific field
    if (event is SearchFeedEvent) {
      yield FeedSearched();

      // try {
      //   Future<List<FeedModel>> feeds = feedRepo.getFeeds();

      //   yield FeedsLoaded(feeds);
      // } catch (_) {
      //   yield FeedsNotLoaded();
      // }
    }
  }
}
