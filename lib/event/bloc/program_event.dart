import 'package:hagerawi_app/event/models/program_model.dart';

abstract class ProgramEvent {}

class LoadProgramsEvent extends ProgramEvent {
  // final ProgramModel program;
  LoadProgramsEvent();
}
