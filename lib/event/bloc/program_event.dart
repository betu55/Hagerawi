import 'package:hagerawi_app/event/models/program_model.dart';

abstract class ProgramEvent {}

class LoadEvent extends ProgramEvent {
  final ProgramModel program;
  LoadEvent(this.program);
}
