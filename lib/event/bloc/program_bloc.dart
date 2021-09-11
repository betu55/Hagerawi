import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/event/bloc/program_event.dart';
import 'package:hagerawi_app/event/bloc/program_state.dart';
import 'package:hagerawi_app/event/models/program_model.dart';
import 'package:hagerawi_app/event/repository/program_repository.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  ProgramRepository programRepository;

  ProgramBloc(this.programRepository) : super(ProgramLoading());

  @override
  Stream<ProgramState> mapEventToState(ProgramEvent event) async* {
    if (event is LoadProgramsEvent) {
      // loading code
      yield ProgramLoading();
      await Future.delayed(Duration(seconds: 1));
      try {
        List<ProgramModel> programs = await programRepository.getPrograms();
        // print("programs $programs");
        yield ProgramLoaded(programs);
      } catch (_) {
        yield ProgramsNotLoaded();
      }
    }
  }
}
