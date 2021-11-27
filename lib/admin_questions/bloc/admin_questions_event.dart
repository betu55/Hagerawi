import 'package:equatable/equatable.dart';

// event base class
abstract class AdminQuestionEvent extends Equatable {}

class PostQuestionEvent extends AdminQuestionEvent {
  final String question;
  final String choices;
  final String answers;
  final String imgUrl;

  PostQuestionEvent(this.question, this.choices, this.answers, this.imgUrl);

  @override
  List<Object?> get props => [question, choices, answers, imgUrl];
}

class UpdateQuestionEvent extends AdminQuestionEvent {
  final String id;
  UpdateQuestionEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteQuestionEvent extends AdminQuestionEvent {
  final String id;
  DeleteQuestionEvent(this.id);

  @override
  List<Object?> get props => [id];
}
