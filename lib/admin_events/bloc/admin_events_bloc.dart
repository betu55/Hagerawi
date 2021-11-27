import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_events/bloc/admin_events_event.dart';
import 'package:hagerawi_app/admin_events/bloc/admin_events_state.dart';
import 'package:hagerawi_app/admin_events/model/admin_events_model.dart';
import 'package:hagerawi_app/admin_events/repository/admin_event_repo.dart';

class AdminEventBloc extends Bloc<AdminEventsEvent, AdminEventState> {
  AdminEventRepo eventRepo;
  AdminEventBloc(this.eventRepo) : super(AdminEventNotUploaded());

  @override
  Stream<AdminEventState> mapEventToState(AdminEventsEvent event) async* {
    if (event is PostEventsEvent) {
      print("here it is");
      // this is the first state shown on the UI until the below try-catch code fetches data from our repository layer
      final imgUrl = event.imgUrl;
      final attendees = event.attendees;
      final postedBy = event.postedBy;
      final title = event.title;
      final location = event.location;
      final content = event.content;

      yield EventsUploading();

      try {
        AdminEventsModel event = await eventRepo.postEvents(
            imgUrl, attendees, postedBy, title, location, content);
        print("at the bloc");
        yield EventsUploaded(event.imgUrl, event.attendees, event.postedBy,
            event.title, event.location, event.content);
      } catch (e) {
        print("at the bloc");
        yield UploadingFailed(errorMsg: e.toString());
      }
    }

    if (event is UpdateEventsEvent) {
      final id = event.id;

      yield EventsUploading();
      try {
        AdminEventsModel event = await eventRepo.updateEvents(id);
        print("at the bloc");
        yield EventsOperationSuccess(event);
      } catch (e) {
        print("at the bloc");
        yield EventsOperationFailed();
      }
    }

    if (event is DeleteEventsEvent) {
      final id = event.id;

      yield EventsUploading();
      try {
        AdminEventsModel event = await eventRepo.deleteEvent(id);
        print("at the bloc");
        yield EventsOperationSuccess(event);
      } catch (e) {
        print("at the bloc");
        yield EventsOperationFailed();
      }
    }
  }
}
