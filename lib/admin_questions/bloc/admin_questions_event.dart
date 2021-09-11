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