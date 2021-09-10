import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/feed/bloc/blocs.dart';
import 'package:hagerawi_app/feed/models/feed_model.dart';
import 'package:hagerawi_app/feed/repository/feed_repo.dart';

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

        yield FeedsLoaded(feeds);
      } catch (_) {
        yield FeedsNotLoaded();
      }
    }

    // when the user searchs for a specific field
    if (event is SearchFeedsEvent) {
      yield SearchFeedsLoading();

      try {
        // print(event.props[0].toString());
        List<FeedModel> searchedFeeds =
            await feedRepo.getSearchedFeeds(event.props[0].toString());

        print(searchedFeeds);
        yield FeedSearched(searchedFeeds);
      } catch (_) {
        yield FeedsNotLoaded();
      }
    }

    if (event is FeedCommentEvent) {
      yield FeedCommentLoading();
      try {
        // print(event.props[0].toString());
        List<FeedModel> comments = await feedRepo.getComments();

        print(comments);
        yield FeedCommentLoaded(comments);
      } catch (_) {
        yield FeedCommentNotLoaded();
      }
    }
  }
}
