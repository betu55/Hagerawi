import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/feed/feed_event_and _state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc(FeedState initialState) : super(initialState);

  FeedState get initialState => FeedsLoading();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
