abstract class AdminQuestionState {}

class QuestionsLoading extends AdminQuestionState {}

class QuestionsLoaded extends AdminQuestionState {
  final String _question;
  final String _choices;
  final String _answers;
  final String _imgUrl;

  QuestionsLoaded(this._question, this._choices, this._answers, this._imgUrl);
}

class AdminQuestionsNotLoaded extends AdminQuestionState {}

class UploadingFailed extends AdminQuestionState {
  final String errorMsg;

  UploadingFailed({required this.errorMsg});
  String get getErrorMsg => errorMsg;
}

class QuestionOperationSuccess extends AdminQuestionState {
  final String questions;

  QuestionOperationSuccess(this.questions);
}

class QuestionOperationFailed extends AdminQuestionState {}
