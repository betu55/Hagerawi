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

    if (event is GetCommentsEvent) {
      yield FeedCommentLoading();
      await Future.delayed(Duration(seconds: 1));
      try {
        print("the title is: ${event.props[0]}");
        List comments = await feedRepo.getComments(event.props[0].toString());
        print("comments in bloc: $comments");
        yield FeedCommentLoaded(comments);
      } catch (_) {
        yield FeedCommentNotLoaded();
      }
    }

    if (event is PostCommentEvent) {
      yield FeedCommentLoading();
      await Future.delayed(Duration(seconds: 1));
      try {
        List updatedCommentList = await feedRepo.postComment(
          event.props[0].toString(),
          event.props[1].toString(),
        );
        print("the comment and identifier title: ${[
          event.props[0].toString(),
          event.props[1].toString(),
        ]}");
        yield FeedCommentLoaded(updatedCommentList);
      } catch (err) {
        print(err);
      }
    }
  }
}
