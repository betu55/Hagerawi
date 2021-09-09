import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_event_and_state.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_repo.dart';

class AdminFeedBloc extends Bloc<AdminFeedEvent, AdminFeedState> {
  AdminFeedRepo feedRepo;
  AdminFeedBloc(this.feedRepo) : super(FeedsUploading());

  @override
  Stream<AdminFeedState> mapEventToState(AdminFeedEvent event) async* {
    // on the case that our user opens the page for the first time
    if (event is FetchAdminFeedsEvent) {
      // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
      yield FeedsUploading();
      // await Future.delayed(Duration(seconds: 15));
      try {
        List<AdminFeedsModel> feeds = await feedRepo.getFeeds();

        // print(feeds[0].detailed);
        yield FeedsUploaded(feeds);
      } catch (_) {
        yield AdminFeedsNotUploaded();
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
