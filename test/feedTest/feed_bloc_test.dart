import 'package:hagerawi_app/feed/bloc/feed_state.dart';
import 'package:hagerawi_app/feed/bloc/blocs.dart';
import 'package:hagerawi_app/feed/repository/feed_repo.dart';

class MockFeedRepo extends Mock implements FeedRepo {}

void main() {
  MockFeedRepo mockFeedRepo;
  mockFeedRepo = MockFeedRepo();
  blocTest(
    'emits [FeedsLoading, FeedsLoaded] when successful',
    build: () {
      when(mockFeedRepo.getFeeds()).thenAnswer((_) async => feeds);
      return FeedBloc(mockFeedRepo);
    },
    act: (bloc) => bloc.add(FetchFeedsEvent()),
    expect: [FeedsLoading(), FeedsLoaded(feeds)],
  );
}
