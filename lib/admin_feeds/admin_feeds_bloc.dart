import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_event_and_state.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_repo.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_state.dart';
import 'package:hagerawi_app/pages/events_post.dart';

class AdminFeedBloc extends Bloc<AdminFeedEvent, AdminFeedState> {
  AdminFeedRepo adminFeedRepo;
  AdminFeedBloc(this.adminFeedRepo) : super(FeedsUpload());

  @override
  Stream<AdminFeedState> mapEventToState(AdminFeedEvent event) async* {
    // on the case that our user opens the page for the first time
    if (event is PostAdminFeedsEvent) {
      final title= event.props[0].toString();
      final author= event.props[1].toString();
      final desc= event.props[2].toString();
      final detail= event.props[3].toString();
      // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
      yield FeedsUploading();
      await Future.delayed(Duration(seconds: 2));

      // await Future.delayed(Duration(seconds: 15));
      try {
        //final feeds = await adminFeedRepo.addFeed(authorController.text.toString());
        AdminFeedsModel feed = await adminFeedRepo.addFeed(title,author,desc,detail);
        // print(feeds[0].detailed);
        //yield FeedsUploaded(feeds);
        try{
          yield FeedsUploaded(feed.title, feed.author, feed.desc, feed.detailed);
        }catch(e){
          print(e);
        }
      } catch (err) {
        yield AdminFeedsNotUploaded(errorMsg:err.toString());
      }
    }

  }
}
