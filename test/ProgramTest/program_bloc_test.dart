import 'package:hagerawi_app/event/bloc/blocs.dart';
import 'package:hagerawi_app/event/bloc/program_event.dart';
import 'package:hagerawi_app/event/bloc/program_state.dart';
import 'package:hagerawi_app/event/repository/program_repository.dart';

class MockProgramRepository extends Mock implements ProgramRepository {}

void main() {
  MockProgramRepository mockEventRepo;
  mockEventRepo = MockProgramRepository();
blocTest(
  'emits [ProgramLoading, ProgramLoaded] when successful',
  build: () {
    when(mockEventRepo.getPrograms())
        .thenAnswer((_) async => programs);
    return ProgramBloc(mockEventRepo);
  },
  act: (bloc) => bloc.add(LoadProgramsEvent(),
  expect: [ProgramLoading(), ProgramLoaded(programs)()],
);
}