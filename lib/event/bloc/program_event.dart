import 'package:equatable/equatable.dart';
import 'package:hagerawi_app/event/models/program_model.dart';

abstract class ProgramEvent extends Equatable {}

class LoadProgramsEvent extends ProgramEvent {
  // final ProgramModel program;
  LoadProgramsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
