import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_feeds/bloc/admin_feeds_event_and_state.dart';
import 'package:hagerawi_app/admin_feeds/models/admin_feeds_model.dart';
import 'package:hagerawi_app/admin_feeds/repository/admin_feeds_repo.dart';

class AdminFeedBloc extends Bloc<AdminFeedEvent, AdminFeedState> {
  AdminFeedRepo feedRepo;
  AdminFeedBloc(this.feedRepo) : super(AdminFeedsNotUploaded());

  @override
  Stream<AdminFeedState> mapEventToState(AdminFeedEvent event) async* {
    if (event is PostFeedsEvent) {
      // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
      final title = event.title;
      final author = event.author;
      final content = event.content;
      final detailed = event.detailed;

      yield FeedsUploading();

      await Future.delayed(Duration(seconds: 15));

      try {
        AdminFeedsModel feed =
            await feedRepo.postFeeds(title, author, content, detailed);
        print("at the bloc");
        yield FeedsUploaded(
            feed.title, feed.author, feed.content, feed.detailed);
      } catch (e) {
        print(e);
        yield UploadingFailed(errorMsg: e.toString());
      }
    }
  }
}
