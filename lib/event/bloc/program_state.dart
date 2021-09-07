import 'package:hagerawi_app/event/models/program_model.dart';

abstract class ProgramState {}

class ProgramLoading extends ProgramState {}

class ProgramLoaded extends ProgramState {
  final ProgramModel programs;
  ProgramLoaded(this.programs);
}
