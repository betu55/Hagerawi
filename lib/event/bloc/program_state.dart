import 'package:hagerawi_app/event/models/program_model.dart';

abstract class ProgramState {}

class ProgramLoading extends ProgramState {}

class ProgramLoaded extends ProgramState {
  List<ProgramModel> _programs;
  ProgramLoaded(this._programs);
  List<ProgramModel> get getEvents => _programs;
}

class ProgramsNotLoaded extends ProgramState {}
