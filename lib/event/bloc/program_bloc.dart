import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/event/bloc/program_event.dart';
import 'package:hagerawi_app/event/bloc/program_state.dart';
import 'package:hagerawi_app/event/repository/program_repository.dart';

class TodoBloc extends Bloc<ProgramEvent, ProgramState> {
  final ProgramRepository todoRepository;

  TodoBloc(this.todoRepository) : super(ProgramLoading());

  @override
  Stream<ProgramState> mapEventToState(ProgramEvent event) async* {
    if (event is LoadEvent) {
      // loading code
      yield ProgramLoading();
      final programs = await todoRepository.getProgram();
      yield ProgramLoaded(programs);
    }
  }
}
