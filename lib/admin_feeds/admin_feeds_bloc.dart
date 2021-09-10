import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_event_and_state.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_repo.dart';

class AdminFeedBloc extends Bloc<AdminFeedEvent, AdminFeedState> {
  AdminFeedRepo feedRepo;
  AdminFeedBloc(this.feedRepo) : super(AdminFeedsNotUploaded());

  @override
  Stream<AdminFeedState> mapEventToState(AdminFeedEvent event) async* {
    if (event is FeedsUploaded) {
      // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
      final title = event.props[0].toString();
      final author = event.props[1].toString();
      final content = event.props[2].toString();
      final detailed = event.props[3].toString();

      yield FeedsUploading();

      await Future.delayed(Duration(seconds: 1));

      try {
        AdminFeedsModel feed =
            await feedRepo.postFeeds(title, author, content, detailed);
        print("at the bloc");
        try {
          yield FeedsUploaded(title, author, content, detailed);
        } catch (e) {
          print(e);
        }
      } catch (e) {
        yield UploadingFailed(errorMsg: e.toString());
      }
    }
  }
}
