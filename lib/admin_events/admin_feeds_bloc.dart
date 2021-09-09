// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hagerawi_app/admin_feeds/admin_feeds_event_and_state.dart';
// import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
// import 'package:hagerawi_app/admin_feeds/admin_feeds_repo.dart';
// import 'package:hagerawi_app/admin_feeds/admin_feeds_state.dart';
// import 'package:hagerawi_app/pages/events_post.dart';

// class AdminFeedBloc extends Bloc<AdminFeedEvent, AdminFeedState> {
//   AdminFeedRepo adminFeedRepo;
//   AdminFeedBloc(this.adminFeedRepo) : super(FeedsUpload());

//   @override
//   Stream<AdminFeedState> mapEventToState(AdminFeedEvent event) async* {
//     // on the case that our user opens the page for the first time
//     if (event is PostAdminFeedsEvent) {
//       final title = event.title;
//       final author = event.author;
//       final desc = event.desc;
//       final detail = event.detail;
//       // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
//       yield FeedsUploading();
//       await Future.delayed(Duration(seconds: 2));

//       // await Future.delayed(Duration(seconds: 15));
//       try {
//         //final feeds = await adminFeedRepo.addFeed(authorController.text.toString());

//         // print(feeds[0].detailed);
//         //yield FeedsUploaded(feeds);
//         yield AdminFeedsNotUploaded();
//       } catch (_) {
//         yield AdminFeedsNotUploaded();
//       }
//     }

//     // when the user searchs for a specific field
//     if (event is SearchFeedEvent) {
//       yield FeedSearched();

//       // try {
//       //   Future<List<FeedModel>> feeds = feedRepo.getFeeds();

//       //   yield FeedsLoaded(feeds);
//       // } catch (_) {
//       //   yield FeedsNotLoaded();
//       // }
//     }
//   }
// }
