import 'package:hagerawi_app/quiz/models/quiz_model.dart';

abstract class QuizState {}

class QuestionsLoading extends QuizState {}

// class NextQuestionLoading extends QuizState {}

class QuestionsLoaded extends QuizState {
  List<QuizModel> _questions;
  QuestionsLoaded(this._questions);
  List<QuizModel> get getQuestions => _questions;
}

class QuestionsNotLoaded extends QuizState {}
